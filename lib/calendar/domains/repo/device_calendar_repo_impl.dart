import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo.dart';
import 'package:device_calendar/device_calendar.dart' as api;
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class DeviceCalendarRepoDefault implements DeviceCalendarRepo {
  final api.DeviceCalendarPlugin plugin;

  DeviceCalendarRepoDefault({required this.plugin});

  @override
  retrieveCalendars() async {
    await plugin.requestPermissions();
    final result = await plugin.retrieveCalendars();
    return result.data?.map((calendar) => calendar.toCalendar()).toList() ?? [];
  }

  @override
  queryEvents(FetchCalendarEventParam param) async {
    final events = await plugin.retrieveEvents(
        param.calendarId,
        api.RetrieveEventsParams(
            startDate: DateTime(2023), endDate: DateTime(2025)));
    final result = events.data
            ?.map((event) => _Conversion.toCalendarEvent(event))
            .toList() ??
        [];
    return result;
  }

  @override
  Future<void> addOrUpdateEvent(CalendarEvent event) async {
    print("event ${event.title} ${event.dateStarted} || ${event.dateEnded}");
    final result =
        await plugin.createOrUpdateEvent(_Conversion.toAPIEvent(event));
    result?.errors.map((e) {
      print("Error occured: ${e.errorCode} || ${e.errorMessage}");
    });
  }
}

extension CalendarConvert on api.Calendar {
  Calendar toCalendar() {
    return Calendar(
      calendarId: id,
      accountName: accountName,
      accountType: accountType,
      name: name,
      isDefault: isDefault,
      colorCode: color,
      isReadOnly: isReadOnly,
    );
  }
}

class _Conversion {
  static CalendarEvent toCalendarEvent(api.Event event) {
    return CalendarEvent(
      calendarId: event.calendarId,
      eventId: event.eventId,
      dateEnded: event.end,
      dateStarted: event.start,
      isAllDay: event.allDay,
      title: event.title,
    );
  }

  static api.Event toAPIEvent(CalendarEvent event) {
    return api.Event(
      event.calendarId,
      title: event.title,
      eventId: event.eventId,
      allDay: event.isAllDay,
      start: event.dateStarted,
      end: event.dateEnded,
    );
  }
}

final deviceCalendarRepoDefaultProvider = Provider<DeviceCalendarRepo>((ref) {
  return DeviceCalendarRepoDefault(plugin: api.DeviceCalendarPlugin());
});
