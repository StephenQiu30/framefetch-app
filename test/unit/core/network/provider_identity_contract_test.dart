import 'package:flutter_test/flutter_test.dart';
import 'package:video_server_api/video_server_api.dart';

void main() {
  test('generated client reads prefer from the public provider contract', () {
    final identity = standardSerializers.deserializeWith(
      ProviderIdentity.serializer,
      'prefer',
    );
    expect(identity, ProviderIdentity.prefer);
    expect(
      standardSerializers.serializeWith(ProviderIdentity.serializer, identity!),
      'prefer',
    );
    expect(
      ProviderIdentity.values
          .where((value) => value != ProviderIdentity.unknownDefaultOpenApi)
          .map(
            (value) => standardSerializers.serializeWith(
              ProviderIdentity.serializer,
              value,
            ),
          ),
      {'none', 'prefer', 'required'},
    );
  });
}
