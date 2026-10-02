import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:video_server_api/video_server_api.dart';

final operationLogQueryProvider = NotifierProvider.autoDispose(
  OperationLogQueryController.new,
);
final adminOperationLogsProvider =
    FutureProvider.autoDispose<OperationLogPageResponse>((ref) {
      ref.watch(
        authSessionProvider.select(
          (session) => (session.phase, session.user?.id, session.user?.role),
        ),
      );
      final query = ref.watch(operationLogQueryProvider);
      return ref
          .watch(adminRepositoryProvider)
          .fetchOperationLogs(
            page: query.page,
            pageSize: query.pageSize,
            query: query.search.isEmpty ? null : query.search,
            outcome: query.outcome == 'all' ? null : query.outcome,
            source: query.scope == 'task' || query.scope == 'request'
                ? query.scope
                : null,
            adminOnly: query.scope == 'admin',
            createdFrom: query.createdFrom,
            createdTo: query.createdTo,
          );
    }, retry: (_, _) => null);

final class OperationLogQuery {
  const OperationLogQuery({
    this.page = 1,
    this.pageSize = 10,
    this.search = '',
    this.scope = 'all',
    this.outcome = 'all',
    this.from = '',
    this.to = '',
  });
  final int page;
  final int pageSize;
  final String search;
  final String scope;
  final String outcome;
  final String from;
  final String to;
  DateTime? get createdFrom => parseOperationLogTime(from)?.toUtc();
  DateTime? get createdTo => parseOperationLogTime(
    to,
  )?.add(const Duration(milliseconds: 59999)).toUtc();
  bool get hasValidDates =>
      (from.isEmpty || createdFrom != null) &&
      (to.isEmpty || createdTo != null) &&
      (createdFrom == null ||
          createdTo == null ||
          !createdTo!.isBefore(createdFrom!));
  OperationLogQuery copyWith({
    int? page,
    int? pageSize,
    String? search,
    String? scope,
    String? outcome,
    String? from,
    String? to,
  }) => OperationLogQuery(
    page: page ?? this.page,
    pageSize: pageSize ?? this.pageSize,
    search: search ?? this.search,
    scope: scope ?? this.scope,
    outcome: outcome ?? this.outcome,
    from: from ?? this.from,
    to: to ?? this.to,
  );
}

DateTime? parseOperationLogTime(String value) {
  if (!RegExp(r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}$').hasMatch(value)) {
    return null;
  }
  final parsed = DateTime.tryParse(value.replaceFirst(' ', 'T'));
  if (parsed == null) return null;
  final canonical =
      '${parsed.year.toString().padLeft(4, '0')}-${parsed.month.toString().padLeft(2, '0')}-${parsed.day.toString().padLeft(2, '0')} ${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  return canonical == value.replaceFirst('T', ' ') ? parsed : null;
}

final class OperationLogQueryController extends Notifier<OperationLogQuery> {
  @override
  OperationLogQuery build() => const OperationLogQuery();
  void page(int value) => state = state.copyWith(page: value);
  void pageSize(int value) => state = state.copyWith(page: 1, pageSize: value);
  void filters({
    String? search,
    String? scope,
    String? outcome,
    String? from,
    String? to,
  }) => state = state.copyWith(
    page: 1,
    search: search?.trim(),
    scope: scope,
    outcome: outcome,
    from: from,
    to: to,
  );
}
