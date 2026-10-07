import 'dart:io';

import 'generated_files.dart';
import 'openapi_config.dart';

Future<void> generateDartClient({
  required Directory projectRoot,
  required AppOpenApiConfig config,
}) async {
  final package = Directory(
    '${projectRoot.path}/packages/framefetch_server_api',
  );
  final manifest = File('${package.path}/.openapi-generator/FILES');
  final previous = await manifest.exists()
      ? await readGeneratedFiles(package)
      : <String>{};
  final generatorJar = await _resolveGeneratorJar(
    projectRoot: projectRoot,
    version: config.generatorVersion,
  );
  await _run('java', [
    '-jar',
    generatorJar,
    'generate',
    '--input-spec',
    '${projectRoot.path}/contracts/openapi/framefetch-server.openapi.json',
    '--generator-name',
    'dart-dio',
    '--output',
    '${projectRoot.path}/packages/framefetch_server_api',
    '--config',
    '${projectRoot.path}/tool/openapi/config.yaml',
  ], workingDirectory: projectRoot.path);

  await normalizeGeneratedManifest(package);
  await pruneObsoleteGeneratedFiles(package, previous);
  await _normalizeGeneratedSources(package);
  await _run(Platform.resolvedExecutable, [
    'pub',
    'get',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'run',
    'build_runner',
    'build',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'fix',
    '--apply',
    '--code=unused_import',
  ], workingDirectory: package.path);
  await _run(Platform.resolvedExecutable, [
    'format',
    '.',
  ], workingDirectory: package.path);
  await _normalizeTextFiles(package);
}

Future<String> _resolveGeneratorJar({
  required Directory projectRoot,
  required String version,
}) async {
  const artifact = 'org.openapitools:openapi-generator-cli';
  await _run('mvn', [
    '-q',
    'dependency:get',
    '-Dartifact=$artifact:$version',
  ], workingDirectory: projectRoot.path);
  final repository = (await _capture('mvn', [
    '-q',
    'help:evaluate',
    '-Dexpression=settings.localRepository',
    '-DforceStdout',
  ])).trim();
  final jar = File(
    '$repository/org/openapitools/openapi-generator-cli/$version/'
    'openapi-generator-cli-$version.jar',
  );
  if (!jar.existsSync()) {
    throw StateError('OpenAPI Generator $version was not resolved by Maven.');
  }
  return jar.path;
}

Future<void> verifyGeneratedClient(Directory projectRoot) async {
  final result = await Process.run('git', [
    'status',
    '--porcelain',
    '--untracked-files=all',
    '--',
    'contracts/openapi/framefetch-server.openapi.json',
    'packages/framefetch_server_api',
  ], workingDirectory: projectRoot.path);
  final changes = (result.stdout as String).trim();
  if (result.exitCode != 0 || changes.isNotEmpty) {
    throw StateError(
      changes.isEmpty
          ? 'Unable to inspect generated files.'
          : 'OpenAPI drift:\n$changes',
    );
  }
}

Future<void> _normalizeGeneratedSources(Directory package) async {
  final pubspec = File('${package.path}/pubspec.yaml');
  var contents = await pubspec.readAsString();
  contents = contents.replaceFirst(
    "  sdk: '>=2.18.0 <4.0.0'",
    "  sdk: '>=3.0.0 <4.0.0'",
  );
  contents = contents.replaceFirst(
    "  built_value_generator: '>=8.4.0 <9.0.0'",
    '  built_value_generator: 8.12.7',
  );
  contents = contents.replaceFirst(
    '  build_runner: any',
    '  build_runner: 2.16.0\n  analyzer: 14.1.0',
  );
  await pubspec.writeAsString(contents);

  final generatedRoot = Directory('${package.path}/lib');
  await for (final entity in generatedRoot.list(
    recursive: true,
    followLinks: false,
  )) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    contents = await entity.readAsString();
    final normalized = contents.replaceFirst(
      '// ignore_for_file: unused_element',
      '// ignore_for_file: unused_element, unused_element_parameter',
    );
    if (normalized != contents) await entity.writeAsString(normalized);
  }
}

Future<void> _normalizeTextFiles(Directory root) async {
  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is! File ||
        (!entity.path.endsWith('.dart') && !entity.path.endsWith('.md'))) {
      continue;
    }
    final original = await entity.readAsString();
    final normalized = original
        .split('\n')
        .map((line) => line.replaceFirst(RegExp(r'[ \t]+$'), ''))
        .join('\n')
        .replaceFirst(RegExp(r'\n*$'), '\n');
    if (normalized != original) await entity.writeAsString(normalized);
  }
}

Future<String> _capture(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);
  if (result.exitCode != 0) {
    throw ProcessException(
      executable,
      arguments,
      '${result.stderr}',
      result.exitCode,
    );
  }
  return result.stdout as String;
}

Future<void> _run(
  String executable,
  List<String> arguments, {
  required String workingDirectory,
}) async {
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    mode: ProcessStartMode.inheritStdio,
  );
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw ProcessException(
      executable,
      arguments,
      'Exited with $exitCode.',
      exitCode,
    );
  }
}
