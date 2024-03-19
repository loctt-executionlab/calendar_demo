import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo.dart';
import 'package:calendar_demo/calendar/domains/repo/device_calendar_repo_impl.dart';
import 'package:calendar_demo/calendar/notifiers/states/device_calendar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart';

part 'device_calendar_notifier.g.dart';

@riverpod
class DeviceCalendarNotifier extends _$DeviceCalendarNotifier {
  late final DeviceCalendarRepo repo;

  @override
  DeviceCalendarState build() {
    repo = ref.watch(deviceCalendarRepoDefaultProvider);
    // state = state.copyWith(events: _getMockEvents());
    // _initGetAllEventFromAllCalendars();
    return DeviceCalendarState(calendars: [], events: _getMockEvents());
  }

  _initGetAllEventFromAllCalendars() async {
    // final calendars = await repo.retrieveCalendars();
    // state = state.copyWith(calendars: calendars);

    // var events = <Event>[];
    // await Future.forEach(calendars, (calendar) async {
    //   await repo
    //       .queryEvents(
    //           FetchCalendarEventParam(calendarId: calendar.calendarId ?? ""))
    //       .then((value) {
    //     events.addAll(value);
    //   });
    // });
    state = state.copyWith(events: []);
  }

  getCalendars() async {
    final calendars = await repo.retrieveCalendars();
    state = state.copyWith(calendars: calendars);
  }

  getEvent(FetchCalendarEventParam param) async {
    final events = await repo.queryEvents(param);
    state = state.copyWith(events: events);
  }

  setEvent(Event event) async {
    repo.addOrUpdateEvent(event);
  }

  Future<bool> requestPermission() async {
    return repo.requestPermission();
  }

  _getMockEvents() {
    return [
      Event(
        calendarId: "1",
        eventId: "1",
        title: "Test event 1",
        dateStarted: TZDateTime.now(getLocation("America/Detroit")),
      ),
      Event(
        calendarId: "1",
        eventId: "2",
        title: "Test event 1",
        dateStarted: TZDateTime.now(getLocation("America/Detroit")),
      ),
      Event(
        calendarId: "1",
        eventId: "3",
        title: "Test event 1",
        dateStarted: TZDateTime.now(getLocation("America/Detroit")),
      ),
      Event(
        calendarId: "1",
        eventId: "4",
        title: "Test event 1",
        dateStarted: TZDateTime.now(getLocation("America/Detroit")),
      ),
    ];
  }
}

// class DeviceCalendarData {
//   final List<DeviceCalendarNotifier> deviceCalendars;
//   final List<CalendarEvent> deviceEvents;

//   DeviceCalendarData(
//       {required this.deviceCalendars, required this.deviceEvents});
// }
