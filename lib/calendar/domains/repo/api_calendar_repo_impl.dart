import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/domains/repo/api_calendar_repo.dart';
import 'package:dio/dio.dart';

class APICalendarRepoImpl implements APICalendarRepo {
  final Dio _dio;

  const APICalendarRepoImpl(this._dio);

  @override
  Future<void> addOrUpdateEvent(Event event) {
    // TODO: implement addOrUpdateEvent
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> queryEvents(FetchCalendarEventParam param) {
    // TODO: implement queryEvents
    throw UnimplementedError();
  }

  @override
  Future<List<Calendar>> retrieveCalendars() {
    // TODO: implement retrieveCalendars
    throw UnimplementedError();
  }
}
