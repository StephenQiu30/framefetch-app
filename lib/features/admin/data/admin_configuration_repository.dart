import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framefetch/features/auth/application/authenticated_request.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

final adminConfigurationRepositoryProvider = Provider(
  (ref) =>
      AdminConfigurationRepository(ref.watch(authenticatedRequestProvider)),
);

final class AdminConfigurationRepository {
  const AdminConfigurationRepository(this.request);
  final AuthenticatedRequest request;
  Future<void> createCatalog(CreateProviderCatalogEntryRequest body) =>
      request.execute((client) async {
        await client.getAdminApi().createProviderCatalogEntry(
          createProviderCatalogEntryRequest: body,
        );
      });
  Future<void> updateCatalog(
    String key,
    UpdateProviderCatalogEntryRequest body,
  ) => request.execute((client) async {
    await client.getAdminApi().updateProviderCatalogEntry(
      providerKey: key,
      updateProviderCatalogEntryRequest: body,
    );
  });
  Future<void> deleteCatalog(String key) => request.execute((client) async {
    await client.getAdminApi().deleteProviderCatalogEntry(providerKey: key);
  });
  Future<void> configureAi(
    AiProviderEngine engine,
    ConfigureAiProviderRequest body,
  ) => request.execute((client) async {
    await client.getAdminApi().configureAiProvider(
      engine: engine,
      configureAiProviderRequest: body,
    );
  });
  Future<void> deleteAi(AiProviderEngine engine) =>
      request.execute((client) async {
        await client.getAdminApi().deleteAiProviderProfile(engine: engine);
      });
}
