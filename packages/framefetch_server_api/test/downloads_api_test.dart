import 'package:test/test.dart';
import 'package:framefetch_server_api/framefetch_server_api.dart';

/// tests for DownloadsApi
void main() {
  final instance = FramefetchServerApi().getDownloadsApi();

  group(DownloadsApi, () {
    // 取消下载任务
    //
    // 请求取消尚未结束的下载任务。
    //
    //Future<ApiResponseDownloadResponse> cancelDownload(String jobId) async
    test('test cancelDownload', () async {
      // TODO
    });

    // 创建下载任务
    //
    // 根据解析结果和语义格式创建异步下载任务。
    //
    //Future<ApiResponseDownloadResponse> createDownload(String idempotencyKey, DownloadRequest downloadRequest) async
    test('test createDownload', () async {
      // TODO
    });

    // 删除下载任务及其私有文件
    //
    // 删除当前用户的任务、下载制品、本地上传源文件与私有封面。
    //
    //Future deleteDownload(String jobId) async
    test('test deleteDownload', () async {
      // TODO
    });

    // 读取已完成的视频文件
    //
    // Stream an owned artifact through the authenticated application origin.
    //
    //Future<Uint8List> downloadFile(String jobId, { bool preview, String range }) async
    test('test downloadFile', () async {
      // TODO
    });

    // 查询下载任务
    //
    // 查询当前登录用户拥有的下载任务。
    //
    //Future<ApiResponseDownloadResponse> getDownload(String jobId) async
    test('test getDownload', () async {
      // TODO
    });

    // 查询下载历史
    //
    // 查询当前登录用户的下载历史。
    //
    //Future<ApiResponseDownloadHistoryResponse> getDownloadHistory({ int page, int pageSize, DownloadStatus status, String search }) async
    test('test getDownloadHistory', () async {
      // TODO
    });

    // 读取下载任务封面
    //
    // 读取当前用户本地导入视频生成的私有首帧封面。
    //
    //Future<Uint8List> getDownloadThumbnail(String jobId) async
    test('test getDownloadThumbnail', () async {
      // TODO
    });

    // 签发文件下载地址
    //
    // 为已完成的下载任务签发短时制品地址。
    //
    //Future<ApiResponseDownloadUrlResponse> issueDownloadUrl(String jobId, { bool preview }) async
    test('test issueDownloadUrl', () async {
      // TODO
    });

    // 重试下载任务
    //
    // 从失败或已取消的任务创建一条新的下载任务。
    //
    //Future<ApiResponseDownloadResponse> retryDownload(String jobId, String idempotencyKey) async
    test('test retryDownload', () async {
      // TODO
    });
  });
}
