import 'package:calendar_demo/calendar/domains/repo/device_calendar_service.dart';
import 'package:calendar_demo/calendar/notifiers/states/device_calendar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_calendar_notifier.g.dart';

@riverpod
class DeviceCalendarNotifier extends _$DeviceCalendarNotifier {
  @override
  DeviceCalendarState build(DeviceCalendarRepo repo) {
    return DeviceCalendarState.initial();
  }

  getCalendar() async {
    final calendars = await repo.retrieveCalendars();
    state = state.copyWith(calendars: calendars);
  }
}

// class DeviceCalendarData {
//   final List<DeviceCalendarNotifier> deviceCalendars;
//   final List<CalendarEvent> deviceEvents;

//   DeviceCalendarData(
//       {required this.deviceCalendars, required this.deviceEvents});
// }
