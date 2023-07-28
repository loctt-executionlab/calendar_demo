import 'package:demo_calendar/models/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends StatelessWidget {
  const WeeklyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar<CalendarEvent>(
      rowHeight: 400,
      weekNumbersVisible: true,
      onFormatChanged: (format) {},
      calendarFormat: CalendarFormat.week,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const <CalendarFormat, String>{
        CalendarFormat.week: 'Week',
      },
      selectedDayPredicate: (day) {
        if (DateUtils.isSameDay(day, DateTime(2023, 7, 23))) {
          return true;
        }
        return false;
      },
      eventLoader: (day) {
        if (DateUtils.isSameDay(day, DateTime(2023, 7, 28))) {
          return [
            const CalendarEvent(
                name: 'Retrospective calendar dev',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
            const CalendarEvent(
                name: '',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
            const CalendarEvent(
                name: 'jlkj',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
            const CalendarEvent(
                name: 'jlkj',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
            const CalendarEvent(
                name: 'jlkj',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
            const CalendarEvent(
                name: 'jlkj',
                startTime: TimeOfDay(hour: 2, minute: 12),
                duration: Duration(hours: 2)),
          ];
        }
        return [];
      },
      calendarStyle: const CalendarStyle(
        cellAlignment: Alignment.topCenter,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return Container(
            color: Colors.black12,
            child: Column(
              children: [
                Text(day.day.toString()),
              ],
            ),
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
        markerBuilder: (context, day, events) {
          return Container(
            color: Colors.amber[50],
            child: Column(
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
                                textScaleFactor: 0.7,
                              ))
                          .toList(),
                    ],
            ),
          );
        },
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}
