import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:potfolio/portfolio/core/constants/api_constants.dart';
import 'package:potfolio/portfolio/core/network/auth_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_provider.g.dart';

class DioProvider {
  late Dio dio;
  DioProvider() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.testBaseurl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "ngrok-skip-browser-warning": "true",
      },
    ));

    dio.interceptors.addAll([
      AuthInterceptor(dio),
      LogInterceptor(
         logPrint: (object) => debugPrint("$object"),
        requestBody: false,
        responseBody: false,
      )
    ]);
  }
}

@riverpod
DioProvider getDioProvider(Ref ref) {
  return DioProvider();
}
