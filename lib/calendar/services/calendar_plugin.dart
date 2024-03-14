import 'package:device_calendar/device_calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_plugin.g.dart';

@riverpod
DeviceCalendarPlugin deviceCalendarPlugin(DeviceCalendarPluginRef ref) {
  return DeviceCalendarPlugin();
}
