import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo.dart';
import 'package:device_calendar/device_calendar.dart' as api;
import 'package:riverpod_annotation/riverpod_annotation.dart';

class DeviceCalendarRepoDefault implements DeviceCalendarRepo {
  final api.DeviceCalendarPlugin plugin;

  DeviceCalendarRepoDefault({required this.plugin});

  @override
  retrieveCalendars() async {
    await plugin.requestPermissions();
    final result = await plugin.retrieveCalendars();
    return result.data
            ?.map((element) => Calendar(calendarId: element.id))
            .toList() ??
        [];
  }

  @override
  queryEvents(FetchCalendarEventParam param) async {
    final events = await plugin.retrieveEvents(
        param.calendarId,
        api.RetrieveEventsParams(
            startDate: DateTime(2023), endDate: DateTime(2025)));
    final result = events.data
            ?.map((event) => CalendarEvent(
                  dateStarted: event.start,
                  dateEnded: event.end,
                  isAllDay: event.allDay,
                  title: event.title,
                ))
            .toList() ??
        [];
    return result;
  }
}

final deviceCalendarRepoDefaultProvider = Provider<DeviceCalendarRepo>((ref) {
  return DeviceCalendarRepoDefault(plugin: api.DeviceCalendarPlugin());
});
