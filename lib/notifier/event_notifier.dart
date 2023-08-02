import 'package:demo_calendar/models/event.dart';
import 'package:demo_calendar/notifier/google_account_notifier.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'event_notifier.g.dart';

@riverpod
class EventNotifier extends _$EventNotifier {
  CalendarApi? get api => ref.watch(gCalendarApiProvider);

  @override
  List<CalendarEvent> build() {
    _getEvent();
    return [];
  }

  _getEvent() async {
    if (api == null) {
      print(
          'calendar api not initialize, most likely auth client is not established');
      return;
    }

    final events = await api!.events.list('primary', singleEvents: true);
    final items = events.items;
    if (items == null) return;
    state = items.map((e) {
      return CalendarEvent.fromGoogleApiEvent(e);
    }).toList();
  }

  List<CalendarEvent> getEventByDate(date) {
    final result = state
        .where((element) => DateUtils.isSameDay(date, element.startTime))
        .toList();
    for (var date in result) {
      debugPrint('current date is ${date.startTime}');
    }
    return result;
  }
}
