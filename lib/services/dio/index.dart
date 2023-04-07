import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mi_pos/services/dio/interceptor.dart';

class DioClient {
  final token =
      '\$2a\$16\$TlB6hYDRMSF5HBgxImeaU.itfBOu881/lI4mSPMR0jYRnMXklQKp6';

  Dio get request {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/',
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
      headers: {'X-SECRET-TOKEN': token},
    ));

    dio.interceptors.addAll({AppInterceptors()});

    return dio;
  }
}
