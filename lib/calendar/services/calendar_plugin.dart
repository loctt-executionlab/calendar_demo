import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_plugin.g.dart';

@riverpod
DeviceCalendarPlugin deviceCalendarPlugin(DeviceCalendarPluginRef ref) {
  return DeviceCalendarPlugin();
}

extension CalendarEventParamConversion on FetchCalendarEventParam {
  RetrieveEventsParams toApiParam() {
    return RetrieveEventsParams(
      eventIds: eventIds,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

extension DataConversion on CalendarEvent {}
