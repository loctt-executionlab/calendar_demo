import 'package:timezone/timezone.dart';

class Calendar {
  final String? calendarId;
  final bool? isDefault;
  final String? accountName;
  final String? accountType;
  final String? name;
  final int? colorCode;
  final bool? isReadOnly;

  Calendar({
    this.calendarId,
    this.accountName,
    this.accountType,
    this.name,
    this.colorCode,
    this.isDefault,
    this.isReadOnly,
  });
}

class CalendarEvent {
  final String? eventId;
  final String? calendarId;
  final TZDateTime? dateStarted;
  final TZDateTime? dateEnded;
  final bool? isAllDay;
  final String? title;
  final int? color;

  CalendarEvent({
    this.eventId,
    this.calendarId,
    this.dateStarted,
    this.dateEnded,
    this.isAllDay,
    this.title,
    this.color,
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
