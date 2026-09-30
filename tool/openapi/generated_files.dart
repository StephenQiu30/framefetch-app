import 'dart:io';

Future<Set<String>> readGeneratedFiles(Directory package) async {
  final manifest = File('${package.path}/.openapi-generator/FILES');
  if (!await manifest.exists()) {
    throw StateError('The generated file manifest is missing.');
  }
  return parseGeneratedFiles(await manifest.readAsString());
}

Set<String> parseGeneratedFiles(String manifest) {
  final paths = manifest
      .split('\n')
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty);
  for (final path in paths) {
    if (path.startsWith('/') ||
        path.contains('\\') ||
        path.contains(':') ||
        path
            .split('/')
            .any((part) => part.isEmpty || part == '.' || part == '..')) {
      throw FormatException('Unsafe generated file path: $path');
    }
  }
  return paths.toSet();
}

Future<void> normalizeGeneratedManifest(Directory package) async {
  final files = await readGeneratedFiles(package);
  for (final test in _testPeers(files)) {
    if (await _regularFile(package, test)) files.add(test);
  }
  final sorted = files.toList()..sort();
  await File(
    '${package.path}/.openapi-generator/FILES',
  ).writeAsString('${sorted.join('\n')}\n');
}

Future<void> pruneObsoleteGeneratedFiles(
  Directory package,
  Set<String> previous,
) async {
  final current = await readGeneratedFiles(package);
  final owned = _withParts(parseGeneratedFiles(previous.join('\n')));
  final retained = _withParts(current);
  for (final path in owned.difference(retained)) {
    if (!_derivedPath(path) || !await _regularFile(package, path)) continue;
    await File('${package.path}/$path').delete();
  }
}

Set<String> _withParts(Set<String> files) => {
  ...files,
  for (final path in files)
    if (path.endsWith('.dart')) '${path.substring(0, path.length - 5)}.g.dart',
  ..._testPeers(files),
};

Set<String> _testPeers(Set<String> files) => {
  for (final path in files)
    if ((path.startsWith('lib/lib/model/') ||
            path.startsWith('lib/lib/api/')) &&
        path.endsWith('.dart'))
      'test/${path.split('/').last.replaceFirst('.dart', '_test.dart')}',
};

bool _derivedPath(String path) =>
    path.startsWith('doc/') ||
    path.startsWith('lib/lib/model/') ||
    path.startsWith('lib/lib/api/') ||
    path.startsWith('test/');

Future<bool> _regularFile(Directory package, String relative) async {
  var path = package.path;
  final parts = relative.split('/');
  for (var index = 0; index < parts.length; index++) {
    path = '$path/${parts[index]}';
    final type = await FileSystemEntity.type(path, followLinks: false);
    if (index == parts.length - 1) return type == FileSystemEntityType.file;
    if (type != FileSystemEntityType.directory) return false;
  }
  return false;
}
