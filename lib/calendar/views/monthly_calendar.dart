import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendar extends ConsumerWidget {
  const MonthlyCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TableCalendar(
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {CalendarFormat.month: 'month'},
      availableGestures: AvailableGestures.all,
      rowHeight: 100,
      daysOfWeekVisible: true,
      headerStyle: HeaderStyle(
        titleTextFormatter: (date, locale) {
          return "Hom nay la ${date.month}";
        },
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return CalendarCell(
            date: day.day.toString(),
            events: [],
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return CalendarCell(date: day.day.toString(), events: []);
        },
        todayBuilder: (context, day, focusedDay) {
          return CalendarCell(date: day.day.toString(), events: []);
        },
        markerBuilder: (context, day, events) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                ),
                ...events.map((e) => const Text(
                      "a event",
                      maxLines: 1,
                      textScaler: TextScaler.linear(0.5),
                    ))
              ],
            ),
          );
        },
      ),
      weekNumbersVisible: false,
      selectedDayPredicate: (day) {
        if (DateUtils.isSameDay(day, DateTime(2023, 7, 25))) {
          return true;
        }
        return false;
      },
      eventLoader: (day) {
        if (day.day == 15) {
          return [
            CalendarEvent(),
            CalendarEvent(),
            CalendarEvent(),
            CalendarEvent(),
          ];
        } else if (day.day == 20) {
          return [
            CalendarEvent(),
            CalendarEvent(),
          ];
        } else {
          return const [];
        }
      },
      calendarStyle: const CalendarStyle(
        markersOffset: PositionedOffset(top: -50),
        canMarkersOverflow: false,
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}

class CalendarCell extends StatelessWidget {
  const CalendarCell({super.key, required this.date, required this.events});

  final String date;

  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Text(date),
          ...buildEventColumn(),
        ],
      ),
    );
  }

  List<Widget> buildEventColumn() {
    if (events.isEmpty) return [];

    var result = <Widget>[];
    for (var i = 0; i < 3 || i < events.length; i++) {
      result.add(buildEvent(events[i]));
    }
    if (events.length > 3) {
      final leftoverEventCount = events.length - 3;
      result.add(Text("+ $leftoverEventCount"));
    }
    return result;
  }

  Widget buildEvent(CalendarEvent event) {
    return const Row(
      children: [Text("俺のイタリアン")],
    );
  }
}
