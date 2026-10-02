import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final sourceDiscoveryRepositoryProvider = Provider<SourceDiscoveryRepository>(
  (ref) => GeneratedSourceDiscoveryRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class SourceDiscoveryRepository {
  Future<SourceDiscoveryResponse> get(String id);
}

final class GeneratedSourceDiscoveryRepository
    implements SourceDiscoveryRepository {
  const GeneratedSourceDiscoveryRepository(this._request);
  final AuthenticatedRequest _request;
  @override
  Future<SourceDiscoveryResponse> get(String id) => _request.execute((
    client,
  ) async {
    final response = await client.getSourceDiscoveriesApi().getSourceDiscovery(
      discoveryId: id,
    );
    final data = response.data?.data;
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
