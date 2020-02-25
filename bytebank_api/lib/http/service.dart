import 'dart:convert';

import 'package:bytebank_api/models/contact.dart';
import 'package:bytebank_api/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

const String baseUrl = 'http://192.168.1.103:8081/transactions';


class LoggingInterceptor implements InterceptorContract {


  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);


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
        'password': '2000'
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
