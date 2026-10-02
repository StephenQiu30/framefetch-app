import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';

final analysisMarkdownRepositoryProvider = Provider(
  (ref) => AnalysisMarkdownRepository(ref.watch(authenticatedRequestProvider)),
);

final class AnalysisMarkdownRepository {
  const AnalysisMarkdownRepository(this.request);
  final AuthenticatedRequest request;

  Future<Uint8List> fetch(String id) => request.execute((client) async {
    final response = await client.getAnalysesApi().exportAnalysisMarkdown(
      analysisId: id,
    );
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return bytes;
  });

  Future<String> fetchText(String id) async {
    try {
      return utf8.decode(await fetch(id));
    } on FormatException {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
  }
}
