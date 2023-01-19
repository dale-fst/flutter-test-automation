import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_test_automation/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on the floating action button, verify counter',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify the counter starts at 0.
    expect(find.text('0'), findsOneWidget);

    // Finds the floating action button to tap on.
    final Finder fab = find.byTooltip('Increment');

    // Emulate a tap on the floating action button.
    await tester.tap(fab);

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('tap on the floating action button 5 times, verify counter',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify the counter starts at 0.
    expect(find.text('0'), findsOneWidget);

    // Finds the floating action button to tap on.
    final Finder fab = find.byTooltip('Increment');

    // Emulate a tap on the floating action button 5 times.
    await tester.tap(fab);
    await tester.tap(fab);
    await tester.tap(fab);
    await tester.tap(fab);
    await tester.tap(fab);

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the counter increments by 1.
    expect(find.text('5'), findsOneWidget);
  });
}
