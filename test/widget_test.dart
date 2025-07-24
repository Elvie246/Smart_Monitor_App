// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construisez notre application et déclenchez un frame.
    await tester.pumpWidget(const MyApp());

    // Vérifiez que notre compteur commence à 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Appuyez sur l'icône '+' et déclenchez un frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Vérifiez que notre compteur a été incrémenté.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
