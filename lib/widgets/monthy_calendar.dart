import 'package:demo_calendar/models/event.dart';
import 'package:demo_calendar/notifier/event_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendar extends ConsumerWidget {
  const MonthlyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCalendar<CalendarEvent>(
      rowHeight: 100,
      onFormatChanged: (format) {},
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {CalendarFormat.month: 'month'},
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) {
        if (DateUtils.isSameDay(day, DateTime(2023, 7, 25))) {
          return true;
        }
        return false;
      },
      eventLoader: (day) {
        print(day);
        final list =
            ref.watch(eventNotifierProvider.notifier).getEventByDate(day);
        print(list.length);
        return list;
      },
      calendarStyle: const CalendarStyle(
        cellAlignment: Alignment.topCenter,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return Column(
            children: [
              Text(day.day.toString()),
            ],
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return Column(
            children: [
              Text(
                day.day.toString(),
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          );
        },
        markerBuilder: (context, day, events) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (events.length > 3)
                ? [
                    ...events
                        .sublist(0, 3)
                        .map((e) => Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 5,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Flexible(
                                  child: Text(
                                    e.name,
                                    maxLines: 1,
                                    textScaleFactor: 0.7,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                    Text('+ ${events.length - 3}'),
                  ]
                : [
                    ...events
                        .map((e) => Text(
                              e.name,
                              maxLines: 1,
                              textScaleFactor: 0.7,
                            ))
                        .toList(),
                  ],
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            constraints: const BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  day.day.toString(),
                ),
              ],
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return Column(
            children: [
              Text(
                day.day.toString(),
                style: const TextStyle(color: Colors.black45),
              ),
            ],
          );
        },
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}
