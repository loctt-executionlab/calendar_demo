import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:timetable/timetable.dart';

class OnScreenCalendarDatePicker extends HookWidget {
  const OnScreenCalendarDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateTapped,
  });

  final DateTime initialDate;
  final Function(DateTime date) onDateTapped;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => DateController());
    final selectedDate = useState(initialDate);
    return TimetableConfig(
      dateController: controller,
      eventBuilder: (context, event) {
        return const SizedBox();
      },
      callbacks: TimetableCallbacks(
        onDateTap: (date) {
          final monthOffset = date.month - selectedDate.value.month;
          if (monthOffset == -1) {
            controller.jumpToPage(date.page - 10);
          }
          if (monthOffset == 1) {
            controller.jumpToPage(date.page + 10);
          }
          // preserve the time
          selectedDate.value = selectedDate.value.copyWith(
            year: date.year,
            month: date.month,
            day: date.day,
          );
          onDateTapped(selectedDate.value);
        },
      ),
      theme: TimetableThemeData(
        context,
        dateHeaderStyleProvider: (date) {
          return DateHeaderStyle(
            context,
            date,
            showDateIndicator: false,
            showWeekdayIndicator: false,
          );
        },
        dateIndicatorStyleProvider: (date) {
          return DateIndicatorStyle(
            context,
            date,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: DateUtils.isSameDay(date, selectedDate.value)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
            ),
            textStyle: TextStyle(
              color: DateUtils.isSameDay(date, selectedDate.value)
                  ? Colors.white
                  : Colors.black,
            ),
            padding: const EdgeInsets.all(8.0),
            label: () {
              context.dependOnTimetableLocalizations();
              return DateFormat('d').format(date);
            }(),
          );
        },
        weekIndicatorStyleProvider: (week) {
          return WeekIndicatorStyle(
            context,
            week,
            labels: const [''],
            padding: EdgeInsets.zero,
          );
        },
      ),
      child: CompactMonthTimetable(),
    );
  }
}
