import 'package:integration_test/integration_test.dart';

import '../test/widget/features/analysis/content_document_result_test.dart'
    as reader;

// Native rendering of the generated result union and private review panels.
// This fixture does not claim live authentication or provider execution.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  reader.main();
}
