import 'package:demo_calendar/models/event.dart';
import 'package:googleapis/calendar/v3.dart';

extension CalendarEventExt on CalendarEvent {
  Event toGoogleEvent() {
    // convert to local time first!!!
    final startTime = start.copyWith(isUtc: false);
    final endTime = end.copyWith(isUtc: false);

    print(startTime);
    print(endTime);
    print(isAllDay);

    return Event(
        start: EventDateTime(
          date: isAllDay ? startTime : null,
          dateTime: !isAllDay ? startTime : null,
        ),
        end: EventDateTime(
          date: isAllDay ? endTime : null,
          dateTime: !isAllDay ? endTime : null,
        ),
        summary: name);
  }
}
