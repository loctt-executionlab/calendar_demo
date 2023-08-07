import 'package:demo_calendar/notifier/event_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetable/timetable.dart';

class WeeklyTimetable extends HookConsumerWidget {
  const WeeklyTimetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(() => DateController(
        initialDate: DateTimeTimetable.today(),
        visibleRange: VisibleDateRange.week(startOfWeek: DateTime.monday)));

    final events = ref.watch(eventNotifierProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return TimetableConfig<BasicEvent>(
          // Required:
          dateController: controller,
          eventBuilder: (context, event) => BasicEventWidget(event),
          // Optional:
          eventProvider: (date) {
            return events
                .where((element) {
                  return element.start.isAfter(date.start) &&
                      element.end.isBefore(date.end);
                })
                .map((e) => BasicEvent(
                    id: e.name,
                    title: e.name,
                    backgroundColor: Colors.blue,
                    start: e.start.toLocal().copyWith(isUtc: true),
                    end: e.end.toLocal().copyWith(isUtc: true)))
                .toList();

            // return [
            //   BasicEvent(
            //       id: 'test',
            //       title: 'test',
            //       backgroundColor: Colors.blue,
            //       start: date.start.copyWith(),
            //       end: date.start.add(Duration(hours: 3)))
            // ];
          },
          allDayEventBuilder: (context, event, info) =>
              BasicAllDayEventWidget(event, info: info),
          // callbacks: TimetableCallbacks(),
          theme: TimetableThemeData(
            context,
            // startOfWeek: DateTime.monday,
            // See the "Theming" section below for more options.
          ),
          child: MultiDateTimetable<BasicEvent>(),
        );
      },
    );
  }
}
