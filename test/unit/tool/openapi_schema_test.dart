import 'package:flutter_test/flutter_test.dart';

import '../../../tool/openapi/openapi_schema.dart';

void main() {
  const branches = [
    {r'$ref': '#/components/schemas/Video'},
    {r'$ref': '#/components/schemas/Document'},
  ];
  Map<String, Object?> record(String kind, {bool required = true}) => {
    'required': required ? ['record_type'] : <String>[],
    'properties': {
      'record_type': {'type': 'string', 'const': kind},
    },
  };

  test('adds a discriminator only when record branches cannot overlap', () {
    final normalized =
        normalizeGeneratorSchema(
              {'anyOf': branches},
              {'Video': record('video'), 'Document': record('document')},
            )
            as Map<String, Object?>;
    expect(normalized['oneOf'], branches);
    expect(normalized['discriminator'], {
      'propertyName': 'record_type',
      'mapping': {
        'video': '#/components/schemas/Video',
        'document': '#/components/schemas/Document',
      },
    });
    expect(normalized, isNot(contains('anyOf')));
  });

  test('preserves nullable or overlapping union wire semantics', () {
    for (final definitions in [
      {'Video': record('video'), 'Document': record('video')},
      {
        'Video': record('video'),
        'Document': record('document', required: false),
      },
    ]) {
      final normalized =
          normalizeGeneratorSchema({'anyOf': branches}, definitions)
              as Map<String, Object?>;
      expect(normalized, {'anyOf': branches});
    }
    expect(
      normalizeGeneratorSchema(
        {
          'anyOf': [
            ...branches,
            {'type': 'null'},
          ],
        },
        {'Video': record('video'), 'Document': record('document')},
      ),
      {
        'anyOf': [
          ...branches,
          {'type': 'null'},
        ],
      },
    );
  });
  test('free-form JSON references preserve arbitrary map values', () {
    expect(
      normalizeGeneratorSchema(
        {
          'type': 'object',
          'additionalProperties': {r'$ref': '#/components/schemas/JsonValue'},
        },
        {'JsonValue': <String, Object?>{}},
      ),
      {'type': 'object', 'additionalProperties': true},
    );
  });
  test(
    'nullable source discriminator is preserved and report null union stays nullable',
    () {
      final union = {
        'oneOf': branches,
        'discriminator': {'propertyName': 'type'},
      };
      expect(
        normalizeGeneratorSchema({
          'anyOf': [
            union,
            {'type': 'null'},
          ],
        }, {}),
        {...union, 'nullable': true},
      );
      final report = {
        'oneOf': branches,
        'discriminator': {'propertyName': 'kind'},
      };
      expect(
        normalizeGeneratorSchema({
          'anyOf': [
            report,
            {'type': 'null'},
          ],
        }, {}),
        {
          'anyOf': [
            report,
            {'type': 'null'},
          ],
        },
      );
    },
  );
  test(
    'enum constant defaults do not generate invalid Dart valueOf initializers',
    () {
      for (final constant in ['skill_report', 'zh-CN', 1]) {
        final normalized =
            normalizeGeneratorSchema({
                  'const': constant,
                  'default': constant,
                }, {})
                as Map;
        expect(normalized['const'], constant);
        expect(normalized, isNot(contains('default')));
      }
    },
  );
}
