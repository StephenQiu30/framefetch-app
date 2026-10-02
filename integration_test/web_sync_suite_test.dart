import 'admin_parity_test.dart' as admin;
import 'web_sync_ui_test.dart' as shared;
import 'workspace_parity_test.dart' as workspace;

// Run synthetic native UI coverage in one app installation. Live service,
// registration mailbox and account tests remain independently configured.
void main() {
  shared.main();
  workspace.main();
  admin.main();
}
