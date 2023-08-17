import 'package:googleapis/calendar/v3.dart' as api;
import 'package:timetable/timetable.dart';

class CalendarEvent extends Event {
  final Object id;
  final String name;

  const CalendarEvent({
    required this.id,
    required this.name,
    required super.start,
    required super.end,
  });

  static CalendarEvent fromGoogleApiEvent(api.Event event) {
    final startTime = event.start?.dateTime?.toUtc() ?? DateTime.now().toUtc();
    final endTime = event.end?.dateTime?.toUtc() ?? startTime;
    return CalendarEvent(
      id: event.id ?? '',
      name: event.summary ?? '',
      start: startTime,
      end: endTime,
    );
  }
}
