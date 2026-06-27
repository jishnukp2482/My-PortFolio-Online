import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:potfolio/portfolio/core/constants/api_constants.dart';
import 'package:potfolio/portfolio/presentation/routes/LocalStorageNames.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/routes/app_routes.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  bool isRefreshing = false;
  List<RequestOptions> failedRequests = [];
  final getStorage = GetStorage();
  AuthInterceptor(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accesstoken = getStorage.read(LocalStorageKeys.accessTokenKEY);
    if (accesstoken != null) {
      options.headers["Authorization"] = "Bearer $accesstoken";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final request = err.requestOptions;
    if (request.path.contains(ApiConstants.refreshToken)) {
      return handler.next(err);
    }
    if (err.response?.statusCode == 401) {
      if (!isRefreshing) {
        isRefreshing = true;
        try {
          final refreshToken =
              getStorage.read(LocalStorageKeys.refreshTokenKEY);
          final response = await dio.post(ApiConstants.refreshToken,
              data: {"refreshToken": refreshToken});

          final newAccessToken = response.data["accessToken"];
          final newRefreshToken = response.data["refreshToken"];
          getStorage.write(LocalStorageKeys.accessTokenKEY, newAccessToken);
          getStorage.write(LocalStorageKeys.refreshTokenKEY, newRefreshToken);
          isRefreshing = false;

          request.headers["Authorization"] = "Bearer $newAccessToken";
          final clonedResponse = await dio.fetch(request);
          return handler.resolve(clonedResponse);
        } catch (e) {
          isRefreshing = false;
          _logOut();
          return handler.next(err);
        }
      }
    }
    return handler.next(err);
  }

  bool isLogout = false;
  void _logOut() {
    if (isLogout) return;
    isLogout = true;
    getStorage.erase();
    final currentPath =
        AppRoutes.routes.routerDelegate.currentConfiguration.fullPath;
    if (currentPath != AppPages.auth) {
      AppRoutes.routes.goNamed(AppPages.auth);
    }
  }
}
