import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_nav/main.dart';

void main() {
  testWidgets('Adaptive Nav smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Home Page is displayed.
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Settings Page'), findsNothing);

    // Tap the Settings icon.
    // Note: Finding the icon might depend on whether it's in Rail or BottomBar.
    // Both use Icons.settings.
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that Settings Page is displayed.
    expect(find.text('Home Page'), findsNothing);
    expect(find.text('Settings Page'), findsOneWidget);
  });
}
