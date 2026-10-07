import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for DocumentsApi
void main() {
  final instance = FramefetchServerApi().getDocumentsApi();

  group(DocumentsApi, () {
    // 取消文档导入
    //
    //Future<ApiResponseDocumentImportResponse> cancelDocumentImport(String documentId) async
    test('test cancelDocumentImport', () async {
      // TODO
    });

    // 完成文档上传并触发验证
    //
    //Future<ApiResponseDocumentImportResponse> completeDocumentImport(String documentId, CompleteDocumentImportRequest completeDocumentImportRequest) async
    test('test completeDocumentImport', () async {
      // TODO
    });

    // 创建文档导入
    //
    //Future<ApiResponseDocumentImportResponse> createDocumentImport(String idempotencyKey, DocumentImportRequest documentImportRequest) async
    test('test createDocumentImport', () async {
      // TODO
    });

    // 创建或刷新文档上传会话
    //
    //Future<ApiResponseDocumentUploadSessionResponse> createDocumentUploadSession(String documentId) async
    test('test createDocumentUploadSession', () async {
      // TODO
    });

    // 删除文档及其制品
    //
    //Future deleteDocument(String documentId) async
    test('test deleteDocument', () async {
      // TODO
    });

    // 查询文档导入
    //
    //Future<ApiResponseDocumentDetailResponse> getDocumentImport(String documentId) async
    test('test getDocumentImport', () async {
      // TODO
    });

    // 查询文档列表
    //
    //Future<ApiResponseDocumentPageResponse> listDocuments({ int page, int pageSize }) async
    test('test listDocuments', () async {
      // TODO
    });
  });
}
