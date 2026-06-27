import 'package:dio/dio.dart';
class CustomHelper {
 static String getErrorMessage(Object e,
      {String defaultMsg = "Something went wrong"}) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map && data["message"] != null) {
        return data["message"];
      }
      return e.response?.statusMessage ?? defaultMsg;
    }
    return defaultMsg;
  }
}

