import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:timetable/timetable.dart';

enum _IsPickerExpanded {
  collapse,
  date,
  time,
}

class InlineDatepicker extends HookWidget {
  const InlineDatepicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => DateController());
    final initialTime = DateTime.now();
    final start = useState(
      initialTime
          .roundTimeToMultipleOf(const Duration(minutes: 30))
          .copyWith(isUtc: true),
    );
    final isPickerExpanded = useState(_IsPickerExpanded.collapse);
    final end = useState(initialTime
        .roundTimeToMultipleOf(const Duration(minutes: 30))
        .add(
          const Duration(hours: 1),
        )
        .copyWith(isUtc: true));

    final dateFormat = DateFormat('EEE, MMM d');
    final timeFormat = DateFormat('hh:mm');
    // final selectedDate = useState(initialData)
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      dateFormat.format(start.value),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    isPickerExpanded.value = _IsPickerExpanded.date;
                  },
                ),
                Text(timeFormat.format(start.value)),
              ],
            ),
            Column(
              children: [
                Text(dateFormat.format(start.value)),
                Text(timeFormat.format(end.value)),
              ],
            )
          ],
        ),
        if (isPickerExpanded.value == _IsPickerExpanded.date)
          TimetableConfig(
            dateController: controller,
            eventBuilder: (context, event) {
              return const SizedBox();
            },
            callbacks: TimetableCallbacks(
              onDateTap: (date) {
                print('date tapped: $date');
              },
            ),
            theme: TimetableThemeData(
              context,
              nowIndicatorStyle:
                  NowIndicatorStyle(context, lineColor: Colors.amber),
              dateHeaderStyleProvider: (date) {
                return DateHeaderStyle(context, date,
                    showDateIndicator: false, showWeekdayIndicator: false);
              },
              dateIndicatorStyleProvider: (date) {
                return DateIndicatorStyle(context, date,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ));
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
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}
