import 'dart:convert';

import 'package:bytebank_api/http/client.dart';
import 'package:bytebank_api/models/contact.dart';
import 'package:bytebank_api/models/transaction.dart';
import 'package:http/http.dart';

class Service {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();

    for(Map<String, dynamic> element in decodedJson) {
      final Map<String, dynamic> contactJson = element['contact'];

      final Transaction trt = Transaction(
          element['value'],
          Contact(
            0,
            contactJson['name'],
            contactJson['accountNumber'],
          )
      );
      transactions.add(trt);
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber
      }
    };
    final String transactionJSON = jsonEncode(transactionMap);

    final Response request = await client.post(
        baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': '1000'
        },
        body: transactionJSON
    );

    final Map<String, dynamic> json = jsonDecode(request.body);
    final Map<String, dynamic> contactJson = json['contact'];

    return Transaction(
      json['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
  }
}
