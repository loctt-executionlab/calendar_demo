import 'package:googleapis/calendar/v3.dart';

class CalendarEvent {
  final String name;
  final DateTime startTime;
  final Duration duration;

  const CalendarEvent({
    required this.name,
    required this.startTime,
    required this.duration,
  });

  static CalendarEvent fromGoogleApiEvent(Event event) {
    final startTime = event.start?.dateTime ?? DateTime.now();
    final endTime = event.end?.date ?? startTime;
    final duration = endTime.difference(startTime);
    return CalendarEvent(
        name: event.summary ?? '', startTime: startTime, duration: duration);
  }
}
