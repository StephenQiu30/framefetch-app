import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/core/network/data_request_failure.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';
import 'package:one_of/one_of.dart';

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

  Future<InspectionResponse> inspectPublicUrl({
    required String idempotencyKey,
    required String url,
  });

  Future<InspectionResponse> inspectDiscoveredItem({
    required String discoveryId,
    required String idempotencyKey,
    required String itemRef,
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
  Future<InspectionResponse> inspectPublicUrl({
    required String idempotencyKey,
    required String url,
  }) {
    final source = PublicUrlInspectionSource(
      (builder) => builder
        ..kind = PublicUrlInspectionSourceKindEnum.publicUrl
        ..url = url,
    );
    return _inspect(source, 1, idempotencyKey);
  }

  @override
  Future<InspectionResponse> inspectDiscoveredItem({
    required String discoveryId,
    required String idempotencyKey,
    required String itemRef,
  }) {
    final source = DiscoveredItemInspectionSource(
      (builder) => builder
        ..kind = DiscoveredItemInspectionSourceKindEnum.discoveredItem
        ..discoveryId = discoveryId
        ..itemRef = itemRef,
    );
    return _inspect(source, 0, idempotencyKey);
  }

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

  Future<InspectionResponse> _inspect(
    Object source,
    int typeIndex,
    String idempotencyKey,
  ) => _required((client) {
    final body = InspectionRequest(
      (builder) => builder.source_.oneOf = OneOfDynamic(
        typeIndex: typeIndex,
        types: const [
          DiscoveredItemInspectionSource,
          PublicUrlInspectionSource,
        ],
        value: source,
      ),
    );
    return client
        .getInspectionsApi()
        .inspectMedia(idempotencyKey: idempotencyKey, inspectionRequest: body)
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
