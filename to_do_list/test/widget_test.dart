import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/main.dart';

void main() {
  testWidgets('Add a new to-do item', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that initially there are no to-do items.
    expect(find.text('Enter a task'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    // Enter a task and add it.
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the new to-do item is displayed.
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
  });

  testWidgets('Toggle a to-do item', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Add a task.
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the new to-do item is displayed and not completed.
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
    Checkbox checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, isFalse);

    // Tap the checkbox to mark it as completed.
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Verify that the to-do item is marked as completed.
    checkbox = tester.widget(find.byType(Checkbox));
    expect(checkbox.value, isTrue);
  });

  testWidgets('Remove a to-do item', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Add a task.
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the new to-do item is displayed.
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);

    // Tap the delete icon to remove the to-do item.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the to-do item is removed.
    expect(find.text('Buy milk'), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });
}
