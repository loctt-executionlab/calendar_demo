import 'package:device_calendar/device_calendar.dart';

class Calendar {}

class CalendarEvent {}

class FetchCalendarEventParam {
  final String calendarId;
  final List<String>? eventIds;
  final DateTime? startDate;
  final DateTime? endDate;

  FetchCalendarEventParam({
    required this.calendarId,
    this.eventIds,
    this.startDate,
    this.endDate,
  });
}

extension CalendarEventParamConversion on FetchCalendarEventParam {
  RetrieveEventsParams toApiParam() {
    return RetrieveEventsParams(
      eventIds: eventIds,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
