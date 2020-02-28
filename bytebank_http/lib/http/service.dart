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

  Future<Transaction> save(Transaction transaction, password) async {
    print('SENHA SERVICE ' + password);
    final String transactionJSON = jsonEncode(transaction.toJson());
    final Response request = await client.post(
        baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password
        },
        body: transactionJSON
    );
    if (request.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(request.body));
    } else {
      _thowHttpError(request.statusCode);
    }
  }

  void _thowHttpError(int statusCode) => throw Exception(_statusCodeResponse[statusCode]);

  static final Map<int, String> _statusCodeResponse = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed'
  };
}
