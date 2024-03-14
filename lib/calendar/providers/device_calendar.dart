import 'package:device_calendar/device_calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_calendar.g.dart';

@riverpod
class DeviceCalendar extends _$DeviceCalendar {
  final plugin = DeviceCalendarPlugin();

  @override
  CalendarData build() {
    fetchData();
    return CalendarData();
  }

  fetchData() async {
    final result = await plugin.retrieveCalendars();
    print("data");
    result.data?.forEach((element) {
      print(
          "calendar: ${element.accountName}, ${element.accountType} ${element.id}");
    });
    print("event");
    final event = await plugin.retrieveEvents(null, null);
    event.data?.forEach((element) {
      print("event: ${element.title}");
    });
  }
}

class CalendarData {}
