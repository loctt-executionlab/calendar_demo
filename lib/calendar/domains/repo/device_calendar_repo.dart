import 'package:calendar_demo/calendar/domains/model/models.dart';

abstract class DeviceCalendarRepo {
  /// get all calendars from different accounts
  Future<List<Calendar>> retrieveCalendars();

  /// query event from a specific calendar
  Future<List<Event>> queryEvents(FetchCalendarEventParam param);

  Future<void> addOrUpdateEvent(Event event);

  Future<bool> requestPermission();
}
