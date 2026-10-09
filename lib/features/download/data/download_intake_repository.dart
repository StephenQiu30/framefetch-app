import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final downloadIntakeRepositoryProvider = Provider<DownloadIntakeRepository>(
  (ref) => GeneratedDownloadIntakeRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class DownloadIntakeRepository {
  Future<SourceDiscoveryResponse> discoverArticle({
    required String idempotencyKey,
    required String url,
  });

  Future<DownloadResponse> createDownload({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  });
}

final class GeneratedDownloadIntakeRepository
    implements DownloadIntakeRepository {
  const GeneratedDownloadIntakeRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<SourceDiscoveryResponse> discoverArticle({
    required String idempotencyKey,
    required String url,
  }) => _required((client) {
    final body = SourceDiscoveryRequest(
      (builder) => builder
        ..kind = SourceDiscoveryRequestKindEnum.wechatOfficialAccountArticle
        ..url = url,
    );
    return client
        .getSourceDiscoveriesApi()
        .createSourceDiscovery(
          idempotencyKey: idempotencyKey,
          sourceDiscoveryRequest: body,
        )
        .then((value) => value.data?.data);
  });

  @override
  Future<DownloadResponse> createDownload({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  }) => _required((client) {
    final body = DownloadRequest(
      (builder) => builder
        ..inspectionId = inspectionId
        ..formatId = formatId,
    );
    return client
        .getDownloadsApi()
        .createDownload(idempotencyKey: idempotencyKey, downloadRequest: body)
        .then((value) => value.data?.data);
  });

  Future<T> _required<T>(
    Future<T?> Function(FramefetchServerApi client) operation,
  ) => _request.execute((client) async {
    final data = await operation(client);
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
