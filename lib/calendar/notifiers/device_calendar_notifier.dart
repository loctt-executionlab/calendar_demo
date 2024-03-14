import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo_impl.dart';
import 'package:calendar_demo/calendar/notifiers/states/device_calendar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_calendar_notifier.g.dart';

@riverpod
class DeviceCalendarNotifier extends _$DeviceCalendarNotifier {
  late final DeviceCalendarRepo repo;

  @override
  DeviceCalendarState build() {
    repo = ref.watch(deviceCalendarRepoDefaultProvider);
    _initGetAllEventFromAllCalendars();
    return DeviceCalendarState.initial();
  }

  _initGetAllEventFromAllCalendars() async {
    final calendars = await repo.retrieveCalendars();
    var events = <CalendarEvent>[];

    await Future.forEach(calendars, (calendar) async {
      await repo
          .queryEvents(
              FetchCalendarEventParam(calendarId: calendar.calendarId ?? ""))
          .then((value) {
        events.addAll(value);
      });
    });
    state = state.copyWith(events: events);
  }

  getCalendars() async {
    final calendars = await repo.retrieveCalendars();
    state = state.copyWith(calendars: calendars);
  }

  getEvent(FetchCalendarEventParam param) async {
    final events = await repo.queryEvents(param);
    state = state.copyWith(events: events);
  }
}

// class DeviceCalendarData {
//   final List<DeviceCalendarNotifier> deviceCalendars;
//   final List<CalendarEvent> deviceEvents;

//   DeviceCalendarData(
//       {required this.deviceCalendars, required this.deviceEvents});
// }
