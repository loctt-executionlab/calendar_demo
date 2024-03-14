import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_calendar_notifier.g.dart';

@riverpod
class DeviceCalendarNotifier extends _$DeviceCalendarNotifier {
  @override
  DeviceCalendarData build(DeviceCalendarRepo repo) {
    return DeviceCalendarData(deviceCalendars: [], deviceEvents: []);
  }
}

class DeviceCalendarData {
  final List<DeviceCalendarNotifier> deviceCalendars;
  final List<CalendarEvent> deviceEvents;

  DeviceCalendarData(
      {required this.deviceCalendars, required this.deviceEvents});
}
