import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kumupro_mvp/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Wait for all async operations to complete
    await tester.pumpAndSettle();

    // Verify that the app starts without crashing
    expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
  });
}
