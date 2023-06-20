import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SingletonDio {
  SingletonDio._internal();
  static final SingletonDio instance = SingletonDio._internal();

  Dio dio = Dio(
    BaseOptions(
      followRedirects: true,
      persistentConnection: false,
    ),
  )..interceptors.addAll([CustomInterceptor()]);
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('URI : ${options.uri}');
    super.onRequest(options, handler);
  }
}
