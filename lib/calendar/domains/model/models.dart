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
