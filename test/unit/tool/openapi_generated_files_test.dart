import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../../tool/openapi/generated_files.dart';

void main() {
  late Directory package;

  setUp(() {
    package = Directory.systemTemp.createTempSync('openapi-files-');
  });
  tearDown(() => package.deleteSync(recursive: true));

  void write(String path, String contents) {
    final file = File('${package.path}/$path');
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(contents);
  }

  test(
    'removes only obsolete manifest files and their generated parts',
    () async {
      const oldModel = 'lib/lib/model/old.dart';
      const newModel = 'lib/lib/model/new.dart';
      final previous = {oldModel, newModel, 'doc/Old.md'};
      for (final path in {
        ...previous,
        'lib/lib/model/old.g.dart',
        'lib/lib/model/new.g.dart',
        'lib/lib/model/custom.dart',
        'test/old_test.dart',
      }) {
        write(path, 'content');
      }
      write('.openapi-generator/FILES', '$newModel\n');

      await pruneObsoleteGeneratedFiles(package, previous);

      for (final path in [
        oldModel,
        'lib/lib/model/old.g.dart',
        'doc/Old.md',
        'test/old_test.dart',
      ]) {
        expect(File('${package.path}/$path').existsSync(), isFalse);
      }
      for (final path in [
        newModel,
        'lib/lib/model/new.g.dart',
        'lib/lib/model/custom.dart',
      ]) {
        expect(File('${package.path}/$path').existsSync(), isTrue);
      }
    },
  );

  test('missing or unsafe manifests cannot delete any file', () async {
    const model = 'lib/lib/model/old.dart';
    write(model, 'content');
    await expectLater(
      pruneObsoleteGeneratedFiles(package, {model}),
      throwsStateError,
    );
    write('.openapi-generator/FILES', '../outside.dart\n');
    await expectLater(
      pruneObsoleteGeneratedFiles(package, {model}),
      throwsFormatException,
    );
    expect(File('${package.path}/$model').existsSync(), isTrue);
  });

  test(
    'existing generated test stubs retain stable manifest ownership',
    () async {
      const model = 'lib/lib/model/new.dart';
      const stub = 'test/new_test.dart';
      write(model, 'content');
      write(stub, 'content');
      write('.openapi-generator/FILES', '$model\n');
      await normalizeGeneratedManifest(package);
      final first = await readGeneratedFiles(package);
      expect(first, {model, stub});
      await normalizeGeneratedManifest(package);
      expect(await readGeneratedFiles(package), first);
    },
  );

  test(
    'does not traverse linked directories or remove package config',
    () async {
      final outside = Directory.systemTemp.createTempSync('openapi-outside-');
      addTearDown(() => outside.deleteSync(recursive: true));
      final target = File('${outside.path}/old.dart')
        ..writeAsStringSync('outside');
      Directory('${package.path}/lib/lib').createSync(recursive: true);
      Link('${package.path}/lib/lib/model').createSync(outside.path);
      write('pubspec.yaml', 'name: package');
      write('.openapi-generator/FILES', '');

      await pruneObsoleteGeneratedFiles(package, {
        'lib/lib/model/old.dart',
        'pubspec.yaml',
      });

      expect(target.readAsStringSync(), 'outside');
      expect(File('${package.path}/pubspec.yaml').existsSync(), isTrue);
    },
  );
}
