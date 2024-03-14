import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:device_calendar/device_calendar.dart';

abstract class DeviceCalendarRepo {
  /// get all calendars from different accounts
  retrieveCalendars();

  /// query event from a specific calendar
  queryEvents(FetchCalendarEventParam param);
}

class DeviceCalendarRepoDefault implements DeviceCalendarRepo {
  final DeviceCalendarPlugin plugin;

  DeviceCalendarRepoDefault({required this.plugin});

  @override
  retrieveCalendars() async {
    return await plugin.retrieveCalendars();
  }

  @override
  queryEvents(FetchCalendarEventParam param) async {
    return await plugin.retrieveEvents(param.calendarId, param.toApiParam());
  }
}
