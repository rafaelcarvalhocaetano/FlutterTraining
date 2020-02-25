import 'package:sqflite/sqflite.dart';

import 'package:bytebank_api/database/database.dart';
import 'package:bytebank_api/models/contact.dart';

class ContactDAO {

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =  await db.query('contacts');
    final List<Contact> contacts = List();
    for (Map<String, dynamic> map in result) {
      final Contact contact = Contact(
        map['id'],
        map['name'],
        map['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}