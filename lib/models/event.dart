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
    print(event.summary);
    print(event.start?.dateTime?.toLocal());
    print(event.end?.dateTime?.toLocal());
    final startTime = event.start?.dateTime?.copyWith(isUtc: true) ??
        event.start?.date?.copyWith(isUtc: true) ??
        DateTime.now().copyWith(
          isUtc: true,
        );
    final endTime = event.end?.dateTime?.copyWith(isUtc: true) ??
        event.end?.date?.copyWith(isUtc: true) ??
        startTime;
    final calendarEvent = CalendarEvent(
      id: event.id ?? '',
      name: event.summary ?? '',
      start: startTime,
      end: endTime,
    );

    print('is fullday event ${calendarEvent.isAllDay}');
    return calendarEvent;
  }
}
