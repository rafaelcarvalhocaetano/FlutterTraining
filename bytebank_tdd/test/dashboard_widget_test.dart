

import 'package:bytebank_tdd/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('should diplay the main image when the dashboard is opended', (WidgetTester test) async {
    await test.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('should diplay dashboard', (test) async {
    await test.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final feature = find.byType(FeatureItem);
    expect(feature, findsWidgets);
  });

  testWidgets('should diplay dashboard', (test) async {
    await test.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final icons = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    expect(icons, findsWidgets);
    final text = find.widgetWithText(FeatureItem, 'Transfer');
    expect(text, findsOneWidget);
  });

  testWidgets('should diplay transaction feature icons', (test) async {
    await test.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final iconTransaction = find.widgetWithIcon(FeatureItem, Icons.description);
    expect(iconTransaction, findsWidgets);
    final textTransaction = find.widgetWithText(FeatureItem, 'Transaction Feed');
    expect(textTransaction, findsOneWidget);
  });


  testWidgets('should diplay transaction feature icons', (test) async {
    await test.pumpWidget(MaterialApp(home: Dashboard(),));

    final transferItem = find.byWidgetPredicate((widget) {
      if (widget is FeatureItem) {
        return widget.labelText == 'Transfer' && widget.iconText == Icons.monetization_on;
      }
      return false;
    });
    expect(transferItem, findsOneWidget);
  });

}