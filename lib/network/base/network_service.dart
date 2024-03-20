import 'package:calendar_demo/network/base/authentication_interceptor.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final String baseUrl;
  Dio _dio;
  Map<String, String> _headers;

  NetworkService({
    required this.baseUrl,
    dioClient,
    httpHeaders,
  })  : _dio = NetworkService._getDefaultDio(baseUrl),
        _headers = httpHeaders;

  static Dio _getDefaultDio(String baseUrl) {
    final defaultOption = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        followRedirects: false,
        headers: {
          'Content-Type': 'application/json',
        });

    return Dio(defaultOption);
  }

  void addInterceptor(Iterable<Interceptor> interceptors) {
    _dio.interceptors.addAll(interceptors);
  }
}
