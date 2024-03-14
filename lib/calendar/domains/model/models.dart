import 'package:timezone/timezone.dart';

class Calendar {
  final String? calendarId;

  Calendar({this.calendarId});
}

class CalendarEvent {
  final TZDateTime? dateStarted;
  final TZDateTime? dateEnded;
  final bool? isAllDay;
  final String? title;

  CalendarEvent({
    this.dateStarted,
    this.dateEnded,
    this.isAllDay,
    this.title,
  });
}

class FetchCalendarEventParam {
  final String calendarId;
  final List<String>? eventIds;
  final TZDateTime? startDate;
  final TZDateTime? endDate;

  FetchCalendarEventParam({
    required this.calendarId,
    this.eventIds,
    this.startDate,
    this.endDate,
  });
}
