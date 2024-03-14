import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_calendar_state.freezed.dart';

@freezed
class DeviceCalendarState with _$DeviceCalendarState {
  const factory DeviceCalendarState({
    required List<Calendar> calendars,
    required List<CalendarEvent> events,
  }) = _DeviceCalendarState;

  factory DeviceCalendarState.initial() => const DeviceCalendarState(
        calendars: [],
        events: [],
      );

  // factory DeviceCalendarState.fromJson(Map<String, dynamic> json) =>
  //     _$DeviceCalendarStateFromJson(json);
}
