import 'package:bytebank_tdd/main.dart';
import 'package:bytebank_tdd/screens/contact_form.dart';
import 'package:bytebank_tdd/screens/contacts_list.dart';
import 'package:bytebank_tdd/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {


  testWidgets('should save a contact', (test) async {
    final mock = MockContato();
    await test.pumpWidget(BytebankApp(contactDAO: mock,));

    final dashboard = find.byType(Dashboard);

    expect(dashboard, findsOneWidget);

    final transfererItem = find.byWidgetPredicate((widget) =>
    featureItem(widget, 'Transfer', Icons.monetization_on));

    expect(transfererItem, findsOneWidget);
    await test.tap(transfererItem);

    await test.pumpAndSettle();

    final contactList = find.byType(ContactList);
    expect(contactList, findsOneWidget);

    final fabNew = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNew, findsOneWidget);

    await test.tap(fabNew);
    await test.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);
  });
}

bool featureItem(Widget widget, String name, IconData icon) {
  if (widget is FeatureItem) {
    return widget.labelText == name && widget.iconText == icon;
  }
  return false;
}