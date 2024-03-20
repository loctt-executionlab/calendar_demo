import 'package:calendar_demo/network/base/authentication_interceptor.dart';
import 'package:calendar_demo/network/base/logger_interceptor.dart';
import 'package:calendar_demo/network/base/network_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_provider.g.dart';

BaseOptions _defaultOption = BaseOptions(
    //TODO: map favor url here
    baseUrl: "asdfasdf",
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    });

final networkProvider = Provider<Dio>((ref) {
  final dio = Dio(_defaultOption);

  dio.interceptors.addAll([
    AuthenticationInterceptor(),
    LoggerInterceptor(),
  ]);

  return dio;
});

@Riverpod(keepAlive: true)
NetworkService defaultNetworkService(DefaultNetworkServiceRef ref) {
  final loggerInterceptor = LoggerInterceptor();
  return NetworkService(baseUrl: "baseurl");
}
