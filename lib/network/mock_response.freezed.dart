// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mock_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MockResponse _$MockResponseFromJson(Map<String, dynamic> json) {
  return _MockResponse.fromJson(json);
}

/// @nodoc
mixin _$MockResponse {
  String get id => throw _privateConstructorUsedError;
  String get dataString => throw _privateConstructorUsedError;
  int get dataInt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MockResponseCopyWith<MockResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MockResponseCopyWith<$Res> {
  factory $MockResponseCopyWith(
          MockResponse value, $Res Function(MockResponse) then) =
      _$MockResponseCopyWithImpl<$Res, MockResponse>;
  @useResult
  $Res call({String id, String dataString, int dataInt});
}

/// @nodoc
class _$MockResponseCopyWithImpl<$Res, $Val extends MockResponse>
    implements $MockResponseCopyWith<$Res> {
  _$MockResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataString = null,
    Object? dataInt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataString: null == dataString
          ? _value.dataString
          : dataString // ignore: cast_nullable_to_non_nullable
              as String,
      dataInt: null == dataInt
          ? _value.dataInt
          : dataInt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MockResponseImplCopyWith<$Res>
    implements $MockResponseCopyWith<$Res> {
  factory _$$MockResponseImplCopyWith(
          _$MockResponseImpl value, $Res Function(_$MockResponseImpl) then) =
      __$$MockResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String dataString, int dataInt});
}

/// @nodoc
class __$$MockResponseImplCopyWithImpl<$Res>
    extends _$MockResponseCopyWithImpl<$Res, _$MockResponseImpl>
    implements _$$MockResponseImplCopyWith<$Res> {
  __$$MockResponseImplCopyWithImpl(
      _$MockResponseImpl _value, $Res Function(_$MockResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataString = null,
    Object? dataInt = null,
  }) {
    return _then(_$MockResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataString: null == dataString
          ? _value.dataString
          : dataString // ignore: cast_nullable_to_non_nullable
              as String,
      dataInt: null == dataInt
          ? _value.dataInt
          : dataInt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MockResponseImpl implements _MockResponse {
  _$MockResponseImpl(
      {required this.id, required this.dataString, required this.dataInt});

  factory _$MockResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MockResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String dataString;
  @override
  final int dataInt;

  @override
  String toString() {
    return 'MockResponse(id: $id, dataString: $dataString, dataInt: $dataInt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MockResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dataString, dataString) ||
                other.dataString == dataString) &&
            (identical(other.dataInt, dataInt) || other.dataInt == dataInt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dataString, dataInt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MockResponseImplCopyWith<_$MockResponseImpl> get copyWith =>
      __$$MockResponseImplCopyWithImpl<_$MockResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MockResponseImplToJson(
      this,
    );
  }
}

abstract class _MockResponse implements MockResponse {
  factory _MockResponse(
      {required final String id,
      required final String dataString,
      required final int dataInt}) = _$MockResponseImpl;

  factory _MockResponse.fromJson(Map<String, dynamic> json) =
      _$MockResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get dataString;
  @override
  int get dataInt;
  @override
  @JsonKey(ignore: true)
  _$$MockResponseImplCopyWith<_$MockResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
