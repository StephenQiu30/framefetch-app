Object? normalizeGeneratorSchema(
  Object? value,
  Map<String, Object?> definitions, {
  bool preserveNullBranch = false,
}) {
  if (value is List) {
    return value
        .map(
          (child) => normalizeGeneratorSchema(
            child,
            definitions,
            preserveNullBranch: preserveNullBranch,
          ),
        )
        .toList(growable: false);
  }
  if (value is! Map) return value;

  final normalized = <String, Object?>{};
  for (final entry in value.entries) {
    final key = entry.key.toString();
    normalized[key] = normalizeGeneratorSchema(
      entry.value,
      definitions,
      preserveNullBranch: key == 'anyOf' || key == 'oneOf',
    );
  }
  // dart-dio 7.22 cannot generate a BuiltValue field for an independent
  // OpenAPI 3.1 null-only field. Keep union null branches unchanged.
  if (!preserveNullBranch && normalized['type'] == 'null') {
    normalized['type'] = 'string';
    normalized['nullable'] = true;
  }
  final variants = normalized['anyOf'];
  if (variants is List &&
      variants.length == 4 &&
      variants.every(
        (variant) =>
            variant is Map &&
            variant.length == 1 &&
            {'string', 'integer', 'boolean', 'null'}.contains(variant['type']),
      ) &&
      variants.map((variant) => (variant as Map)['type']).toSet().length == 4) {
    // These JSON primitive types cannot overlap. oneOf has identical wire
    // semantics and avoids dart-dio's broken AnyOf response serialization.
    normalized.remove('anyOf');
    normalized['oneOf'] = variants;
  } else if (variants is List) {
    _normalizeRecordUnion(normalized, variants, definitions);
  }
  final enumValues = normalized['enum'];
  // Official generator enum names preserve the circled gate wire values.
  if (enumValues is List && enumValues.join(',') == '①,②,③,none') {
    normalized['x-enum-varnames'] = ['gateOne', 'gateTwo', 'gateThree', 'none'];
  }
  return normalized;
}

void _normalizeRecordUnion(
  Map<String, Object?> normalized,
  List<dynamic> variants,
  Map<String, Object?> definitions,
) {
  if (variants.length < 2) return;
  const prefix = '#/components/schemas/';
  const field = 'record_type';
  final mapping = <String, String>{};
  for (final variant in variants) {
    if (variant is! Map) return;
    final reference = variant[r'$ref'];
    if (reference is! String || !reference.startsWith(prefix)) return;
    final schema = definitions[reference.substring(prefix.length)];
    if (schema is! Map) return;
    final required = schema['required'];
    final properties = schema['properties'];
    if (required is! List || !required.contains(field) || properties is! Map) {
      return;
    }
    final discriminator = properties[field];
    if (discriminator is! Map) return;
    final discriminatorValue = discriminator['const'];
    if (discriminatorValue is! String ||
        mapping.containsKey(discriminatorValue)) {
      return;
    }
    mapping[discriminatorValue] = reference;
  }
  // Required, distinct constants make branches mutually exclusive. A
  // discriminator stops dart-dio merging video and screenplay record fields.
  normalized.remove('anyOf');
  normalized['oneOf'] = variants;
  normalized['discriminator'] = {'propertyName': field, 'mapping': mapping};
}
