import 'dart:convert';

import 'package:bytebank_tdd/http/client.dart';
import 'package:bytebank_tdd/models/transaction.dart';
import 'package:http/http.dart';

class Service {

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((x) => Transaction.fromJson(x)).toList();
  }

  Future<Transaction> save(Transaction transaction, password) async {

    final String transactionJSON = jsonEncode(transaction.toJson());
    await Future.delayed(Duration(seconds: 2));

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
    }
    throw HttpException(_getMessage(request.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponse.containsKey((statusCode))) {
      return _statusCodeResponse[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponse = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed',
    409: 'Transaction always exists'
  };
}
class HttpException implements Exception {
  final String message;
  HttpException(this.message);
}