import 'package:http/http.dart';

import 'package:bytebank_http/http/interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: Duration(seconds: 5),
);

const String baseUrl = 'http://192.168.1.103:8081/transactions';