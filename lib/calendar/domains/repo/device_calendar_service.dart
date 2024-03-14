import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/services/calendar_plugin.dart';
import 'package:device_calendar/device_calendar.dart' as api;

abstract class DeviceCalendarRepo {
  /// get all calendars from different accounts
  Future<List<Calendar>> retrieveCalendars();

  /// query event from a specific calendar
  Future<List<CalendarEvent>> queryEvents(FetchCalendarEventParam param);
}

class DeviceCalendarRepoDefault implements DeviceCalendarRepo {
  final api.DeviceCalendarPlugin plugin;

  DeviceCalendarRepoDefault({required this.plugin});

  @override
  retrieveCalendars() async {
    final result = await plugin.retrieveCalendars();
    return result.data
            ?.map((element) => Calendar(calendarId: element.id))
            .toList() ??
        [];
  }

  @override
  queryEvents(FetchCalendarEventParam param) async {
    final event =
        await plugin.retrieveEvents(param.calendarId, param.toApiParam());
    final result = event.data?.map((element) => CalendarEvent()).toList() ?? [];
    return result;
  }
}
