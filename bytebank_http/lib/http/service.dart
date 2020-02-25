import 'dart:convert';

import 'package:bytebank_http/http/client.dart';
import 'package:bytebank_http/models/transaction.dart';
import 'package:http/http.dart';

class Service {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((x) => Transaction.fromJson(x)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJSON = jsonEncode(transaction.toJson());
    final Response request = await client.post(
        baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': '1000'
        },
        body: transactionJSON
    );
    return Transaction.fromJson(jsonDecode(request.body));
  }
}
