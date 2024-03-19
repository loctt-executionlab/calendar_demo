import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/notifiers/device_calendar_notifier.dart';
import 'package:calendar_demo/calendar/views/components.dart';
import 'package:calendar_demo/utils/dateUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendar extends ConsumerWidget {
  const MonthlyCalendar({super.key});

  Iterable<Event> _filterEvent(DateTime day, List<Event> events) {
    return events.where((event) => event.dateStarted?.isSameDate(day) ?? false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarData = ref.watch(deviceCalendarNotifierProvider);
    final events = ref
        .watch(deviceCalendarNotifierProvider.select((value) => value.events));
    return TableCalendar<Event>(
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {CalendarFormat.month: 'month'},
      availableGestures: AvailableGestures.all,
      rowHeight: 70,
      daysOfWeekVisible: true,
      // headerStyle: HeaderStyle(
      //   titleTextFormatter: (date, locale) {
      //     return "Hom nay la ${date.month}";
      //   },
      // ),

      locale: 'ja_JP',
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return Container(
            color: Colors.red.withOpacity(0.1),
            child: DateCell(
              date: day.day.toString(),
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return DateCell(
            date: day.day.toString(),
          );
        },
        withinRangeBuilder: (context, day, focusedDay) {
          return DateCell(
            date: day.day.toString(),
          );
        },
        holidayBuilder: (context, day, focusedDay) {
          return DateCell(
            date: day.day.toString(),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        disabledBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        rangeEndBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        // rangeHighlightBuilder: (context, day, isWithinRange) {
        //   return DateCell(date: day.day.toString());
        // },
        rangeStartBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        selectedBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },

        markerBuilder: (context, day, events) {
          return EventCell(events: events);
        },
      ),
      weekNumbersVisible: false,
      sixWeekMonthsEnforced: true,
      eventLoader: (day) => calendarData.events.where((event) {
        return (event.dateStarted?.year == day.year &&
                event.dateStarted?.month == day.month &&
                event.dateStarted?.day == day.day)
            ? true
            : false;
      }).toList(),
      calendarStyle: const CalendarStyle(
        markersAlignment: Alignment.bottomCenter,
        cellAlignment: Alignment.topCenter,
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}
