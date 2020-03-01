import 'package:bytebank_tdd/screens/contact_form.dart';
import 'package:bytebank_tdd/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('save', (test) async {
    final fab = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fab, findsOneWidget);

    await test.tap(fab);
    await test.pumpAndSettle();

    final form = find.byType(ContactForm);
    expect(form, findsOneWidget);

    final text = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Full name';
      }
      return false;
    });
    expect(text, findsOneWidget);
    await test..enterText(text, 'Rafael');

    final accountNamber = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Full name';
      }
      return false;
    });
    expect(text, findsOneWidget);
    await test.enterText(accountNamber, '1000');

    final contactList = find.byType(ContactList);
    expect(contactList, findsOneWidget);

    final createButton = find.widgetWithText(RaisedButton, 'Create');
    expect(createButton, findsOneWidget);
    await test.tap(createButton);
    await test.pumpAndSettle();

    final contactListBack = find.byType(ContactList);
  });
}