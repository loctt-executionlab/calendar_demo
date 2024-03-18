import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/notifiers/device_calendar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendar extends ConsumerWidget {
  const MonthlyCalendar({super.key});

  Widget _buildItem(Event event) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
      child: Row(
        children: [
          Container(
            width: 1,
            height: 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              event.title ?? "",
              maxLines: 1,
              style: const TextStyle(
                fontSize: 8,
                overflow: TextOverflow.visible,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildEventColumn(List<Event> events) {
    if (events.isEmpty) return [];

    var result = <Widget>[];
    for (var i = 0; i < 3 || i < events.length; i++) {
      result.add(_buildItem(events[i]));
    }
    if (events.length > 3) {
      final leftoverEventCount = events.length - 3;
      result.add(
        Text(
          "+$leftoverEventCount",
          style: const TextStyle(
            fontSize: 8,
            height: 1,
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarData = ref.watch(deviceCalendarNotifierProvider);
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
          print("build date");
          return DateCell(
            date: day.day.toString(),
          );
        },
        weekNumberBuilder: (context, weekNumber) {},
        outsideBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        todayBuilder: (context, day, focusedDay) {
          return DateCell(date: day.day.toString());
        },
        markerBuilder: (context, day, events) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: buildEventColumn(events),
            ),
          );
        },
      ),
      weekNumbersVisible: false,
      eventLoader: (day) => calendarData.events.where((event) {
        return (event.dateStarted?.year == day.year &&
                event.dateStarted?.month == day.month &&
                event.dateStarted?.day == day.day)
            ? true
            : false;
      }).toList(),
      calendarStyle: const CalendarStyle(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}

class EventCell extends StatelessWidget {
  const EventCell({
    super.key,
    required this.events,
    this.colorCode = 0,
  });
  final List<Event> events;
  final int? colorCode;

  Widget buildEvent(Event event) {
    return const Row(
      children: [Text("俺のイタリアン")],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...buildEventColumn(),
      ],
    );
  }
}

class DateCell extends StatelessWidget {
  const DateCell({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
