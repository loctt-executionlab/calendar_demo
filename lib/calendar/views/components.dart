import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:flutter/material.dart';

class EventCell extends StatelessWidget {
  const EventCell({
    super.key,
    required this.events,
    this.colorCode = 0,
  });
  final List<Event> events;
  final int? colorCode;

  Widget _buildEvent(Event event) {
    return Row(
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
              fontSize: 6,
              overflow: TextOverflow.visible,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> buildEventColumn() {
    if (events.isEmpty) return [];

    var result = <Widget>[];
    for (var i = 0; i < 3 && i < events.length; i++) {
      result.add(_buildEvent(events[i]));
    }

    if (events.length > 3) {
      final leftoverEventCount = events.length - 3;
      result.add(Text(
        "+ $leftoverEventCount",
        style: const TextStyle(fontSize: 6),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.withOpacity(0.2),
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // matching spacing with date
          const Text(
            "",
            style: TextStyle(
              fontSize: 14,
              color: Colors.transparent,
            ),
          ),
          ...buildEventColumn(),
        ],
      ),
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
      child: Text(
        date,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class CalendarCell extends StatelessWidget {
  const CalendarCell({super.key, required this.date, required this.events});

  final String date;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateCell(date: date),
        EventCell(events: events),
      ],
    );
  }
}
