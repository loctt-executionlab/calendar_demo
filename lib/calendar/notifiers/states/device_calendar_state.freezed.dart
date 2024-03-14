// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceCalendarState {
  List<Calendar> get calendars => throw _privateConstructorUsedError;
  List<CalendarEvent> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceCalendarStateCopyWith<DeviceCalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCalendarStateCopyWith<$Res> {
  factory $DeviceCalendarStateCopyWith(
          DeviceCalendarState value, $Res Function(DeviceCalendarState) then) =
      _$DeviceCalendarStateCopyWithImpl<$Res, DeviceCalendarState>;
  @useResult
  $Res call({List<Calendar> calendars, List<CalendarEvent> events});
}

/// @nodoc
class _$DeviceCalendarStateCopyWithImpl<$Res, $Val extends DeviceCalendarState>
    implements $DeviceCalendarStateCopyWith<$Res> {
  _$DeviceCalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendars = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      calendars: null == calendars
          ? _value.calendars
          : calendars // ignore: cast_nullable_to_non_nullable
              as List<Calendar>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEvent>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceCalendarStateImplCopyWith<$Res>
    implements $DeviceCalendarStateCopyWith<$Res> {
  factory _$$DeviceCalendarStateImplCopyWith(_$DeviceCalendarStateImpl value,
          $Res Function(_$DeviceCalendarStateImpl) then) =
      __$$DeviceCalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Calendar> calendars, List<CalendarEvent> events});
}

/// @nodoc
class __$$DeviceCalendarStateImplCopyWithImpl<$Res>
    extends _$DeviceCalendarStateCopyWithImpl<$Res, _$DeviceCalendarStateImpl>
    implements _$$DeviceCalendarStateImplCopyWith<$Res> {
  __$$DeviceCalendarStateImplCopyWithImpl(_$DeviceCalendarStateImpl _value,
      $Res Function(_$DeviceCalendarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendars = null,
    Object? events = null,
  }) {
    return _then(_$DeviceCalendarStateImpl(
      calendars: null == calendars
          ? _value._calendars
          : calendars // ignore: cast_nullable_to_non_nullable
              as List<Calendar>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEvent>,
    ));
  }
}

/// @nodoc

class _$DeviceCalendarStateImpl implements _DeviceCalendarState {
  const _$DeviceCalendarStateImpl(
      {required final List<Calendar> calendars,
      required final List<CalendarEvent> events})
      : _calendars = calendars,
        _events = events;

  final List<Calendar> _calendars;
  @override
  List<Calendar> get calendars {
    if (_calendars is EqualUnmodifiableListView) return _calendars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calendars);
  }

  final List<CalendarEvent> _events;
  @override
  List<CalendarEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'DeviceCalendarState(calendars: $calendars, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCalendarStateImpl &&
            const DeepCollectionEquality()
                .equals(other._calendars, _calendars) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_calendars),
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCalendarStateImplCopyWith<_$DeviceCalendarStateImpl> get copyWith =>
      __$$DeviceCalendarStateImplCopyWithImpl<_$DeviceCalendarStateImpl>(
          this, _$identity);
}

abstract class _DeviceCalendarState implements DeviceCalendarState {
  const factory _DeviceCalendarState(
      {required final List<Calendar> calendars,
      required final List<CalendarEvent> events}) = _$DeviceCalendarStateImpl;

  @override
  List<Calendar> get calendars;
  @override
  List<CalendarEvent> get events;
  @override
  @JsonKey(ignore: true)
  _$$DeviceCalendarStateImplCopyWith<_$DeviceCalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
