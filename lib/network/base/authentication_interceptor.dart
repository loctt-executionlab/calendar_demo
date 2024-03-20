import 'package:dio/dio.dart';

class AuthenticationInterceptor extends Interceptor {
  // TODO: fetch token
  String? get accessToken => null;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest

    if (accessToken != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    }
    super.onRequest(options, handler);
  }

  // Why ?
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }
}
