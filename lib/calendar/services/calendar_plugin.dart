import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:device_calendar/device_calendar.dart';

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
