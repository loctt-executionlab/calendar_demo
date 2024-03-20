import 'package:freezed_annotation/freezed_annotation.dart';

part 'mock_response.freezed.dart';
part 'mock_response.g.dart';

@freezed
class MockResponse with _$MockResponse {
  factory MockResponse({
    required String id,
    required String dataString,
    required int dataInt,
  }) = _MockResponse;

  factory MockResponse.fromJson(Map<String, dynamic> json) =>
      _$MockResponseFromJson(json);
}
