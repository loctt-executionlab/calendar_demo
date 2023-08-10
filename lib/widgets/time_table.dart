import 'package:demo_calendar/notifier/event_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetable/timetable.dart';
import 'package:collection/collection.dart';

class WeeklyTimetable extends HookConsumerWidget {
  const WeeklyTimetable({Key? key}) : super(key: key);

  dosomething() {
    print('rebuilt disposed');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('rebuilt');
    useAutomaticKeepAlive();
    final controller = useMemoized(() => DateController(
        initialDate: DateTimeTimetable.today(),
        visibleRange: VisibleDateRange.week(startOfWeek: DateTime.monday)));

    useEffect(() {
      return dosomething();
    });

    final events = ref.watch(eventNotifierProvider);

    final draggedEvents = useValueNotifier<List<BasicEvent>>([]);
    print('rebuilt event count ${draggedEvents.value.length}');
    return LayoutBuilder(
      builder: (context, constraints) {
        return TimetableConfig<BasicEvent>(
          // Required:

          dateController: controller,
          eventBuilder: (context, event) => PartDayDraggableEvent(
            onDragStart: () {
              draggedEvents.value = [...draggedEvents.value..add(event)];
            },
            onDragUpdate: (dateTime) {
              dateTime =
                  dateTime.roundTimeToMultipleOf(const Duration(minutes: 15));
              final index = draggedEvents.value
                  .indexWhere((element) => element.id == event.id);
              final oldEvent = draggedEvents.value[index];
              draggedEvents.value[index] = oldEvent.copyWith(
                start: dateTime,
                end: dateTime.add(oldEvent.duration),
              );
              draggedEvents.value = [...draggedEvents.value];
            },
            child: BasicEventWidget(event),
          ),

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
          timeOverlayProvider: mergeTimeOverlayProviders([
            (context, date) {
              print('rebuilt at  a${draggedEvents.value.length}');
              if (draggedEvents.value.isNotEmpty) {
                print(' rebuilt at ${draggedEvents.value.first.start}');
              }
              return draggedEvents.value
                  .map(
                    (it) => it.toTimeOverlay(
                        date: date, widget: BasicEventWidget(it)),
                  )
                  .whereNotNull()
                  .toList();
            }
          ]),
          allDayEventBuilder: (context, event, info) =>
              BasicAllDayEventWidget(event, info: info),
          // callbacks: TimetableCallbacks(),
          theme: TimetableThemeData(context,
              nowIndicatorStyle: NowIndicatorStyle(context,
                  lineColor: Colors.red,
                  shape: CircleNowIndicatorShape(color: Colors.red))
              // startOfWeek: DateTime.monday,
              // See the "Theming" section below for more options.
              ),
          child: MultiDateTimetable<BasicEvent>(),
        );
      },
    );
  }
}
