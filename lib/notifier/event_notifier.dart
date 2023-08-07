import 'package:demo_calendar/models/event.dart';
import 'package:demo_calendar/notifier/google_account_notifier.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
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
    ref.listen(googleSignInProvider, (previous, next) {
      next.authenticatedClient().then((value) {
        if (value != null) {
          CalendarApi(value);
          _getEvent();
        }
      });
    });

    return [];
  }

  _getEvent() async {
    if (api == null) {
      print(
          'calendar api not initialize, most likely auth client is not established');
      return;
    }

    final events = await api!.events
        .list('primary', singleEvents: true, timeMin: DateTime(2023, 8, 0));
    final items = events.items;
    if (items == null) return;
    print('list of item ${items.length}');
    state = items.map((e) {
      return CalendarEvent.fromGoogleApiEvent(e);
    }).toList();
  }

  List<CalendarEvent> getEventByDate(DateTime date) {
    final result = state
        .where((element) => DateUtils.isSameDay(date, element.start))
        .toList();
    for (var date in result) {
      debugPrint('current date is ${date.start}');
    }
    return result;
  }

  List<CalendarEvent> getEventInBetween(DateTime start, DateTime end) {
    final result = state
        .where((element) =>
            element.start.isAfter(start) && element.end.isBefore(end))
        .toList();
    for (var date in result) {
      debugPrint('current date is ${date.start}');
    }
    return result;
  }
}
