import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sample/page/testing.dart';

void main() {
  group('fetchPost', () {
    // Define a test. The TestWidgets function also provides a WidgetTester
    // to work with. The WidgetTester allows you to build and interact
    // with widgets in the test environment.
    testWidgets('MyWidget has a title and message',
        (WidgetTester tester) async {
      final testKey = Key('mykey');

      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(MyWidget(key: testKey, title: 'T', message: 'M'));

      // Create the Finders.
      final titleFinder = find.text('T');
      final messageFinder = find.text('M');
      final nothingFinder = find.text('J');

      expect(find.byKey(testKey), findsOneWidget);

      // Use the `findsOneWidget` matcher provided by flutter_test to verify
      // that the Text widgets appear exactly once in the widget tree.
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
      expect(nothingFinder, findsNothing);
      //Also has findsWidgets and findsNWidgets
    });

    testWidgets('MyWidget has a specific widget instance',
        (WidgetTester tester) async {
      final childWidget = Padding(padding: const EdgeInsets.all(8.0));
      await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));
      // Search for the childWidget in the tree and verify it exists.
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
}
