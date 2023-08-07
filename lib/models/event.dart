import 'package:googleapis/calendar/v3.dart' as api;
import 'package:timetable/timetable.dart';

class CalendarEvent extends Event {
  final String name;

  const CalendarEvent({
    required this.name,
    required super.start,
    required super.end,
  });

  static CalendarEvent fromGoogleApiEvent(api.Event event) {
    final startTime = event.start?.dateTime?.toUtc() ?? DateTime.now().toUtc();
    print(startTime);
    final endTime = event.end?.dateTime?.toUtc() ?? startTime;
    return CalendarEvent(
        name: event.summary ?? '', start: startTime, end: endTime);
  }
}
