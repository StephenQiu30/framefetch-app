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
}
