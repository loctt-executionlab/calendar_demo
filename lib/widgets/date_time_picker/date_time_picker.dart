import 'package:demo_calendar/widgets/date_time_picker/calendar_date_picker.dart';
import 'package:demo_calendar/widgets/date_time_picker/time_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:timetable/timetable.dart';

enum _IsPickerExpanded {
  collapse,
  startdate,
  starttime,
  enddate,
  endtime,
}

class DateTimePicker extends HookWidget {
  const DateTimePicker({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  final ValueNotifier<DateTime> start;
  final ValueNotifier<DateTime> end;

  @override
  Widget build(BuildContext context) {
    final isPickerExpanded = useState(_IsPickerExpanded.collapse);
    final isFullDay = useState(false);
    final dateFormat = DateFormat('EEE, MMM d');
    final timeFormat = DateFormat('HH:mm');
    // final selectedDate = useState(initialData)
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.schedule,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 24),
            const Text('All day', style: TextStyle(fontSize: 20)),
            const Spacer(),
            Switch(
              value: isFullDay.value,
              onChanged: (value) {
                if (value) {
                  isFullDay.value = value;
                  isPickerExpanded.value = _IsPickerExpanded.collapse;
                  start.value = start.value.atStartOfDay;
                  end.value = end.value.atStartOfDay;
                  return;
                } else {
                  isFullDay.value = value;
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ValueListenableBuilder(
                valueListenable: start,
                builder: (context, dateTime, widget) {
                  return Column(
                    children: [
                      _DateToggleButton(
                          whenExpand: _IsPickerExpanded.startdate,
                          isPickerExpanded: isPickerExpanded,
                          dateFormat: dateFormat,
                          date: dateTime),
                      if (!isFullDay.value)
                        _TimeToggleButton(
                            isPickerExpanded: isPickerExpanded,
                            whenExpand: _IsPickerExpanded.starttime,
                            timeFormat: timeFormat,
                            time: dateTime),
                    ],
                  );
                }),
            const SizedBox(width: 80.0),
            ValueListenableBuilder(
                valueListenable: end,
                builder: (context, dateTime, widget) {
                  return Column(
                    children: [
                      _DateToggleButton(
                          isPickerExpanded: isPickerExpanded,
                          whenExpand: _IsPickerExpanded.enddate,
                          dateFormat: dateFormat,
                          date: dateTime),
                      if (!isFullDay.value)
                        _TimeToggleButton(
                            isPickerExpanded: isPickerExpanded,
                            whenExpand: _IsPickerExpanded.endtime,
                            timeFormat: timeFormat,
                            time: dateTime),
                    ],
                  );
                })
          ],
        ),
        // start date picker
        if (isPickerExpanded.value == _IsPickerExpanded.startdate)
          OnScreenCalendarDatePicker(
            initialDate: start.value,
            onDateTapped: (date) {
              if (!date.isBefore(end.value)) {
                end.value = date.add(const Duration(hours: 1));
              }
              start.value = date;
            },
          ),
        // end date picker
        if (isPickerExpanded.value == _IsPickerExpanded.enddate)
          OnScreenCalendarDatePicker(
            initialDate: end.value,
            onDateTapped: (date) {
              if (!date.isAfter(start.value)) {
                start.value = date.subtract(const Duration(hours: 1));
              }
              end.value = date;
            },
          ),
        // start time picker
        if (isPickerExpanded.value == _IsPickerExpanded.starttime)
          TimeSelector(
            initialTime: start.value,
            onChange: (time) {
              if (!time.isBefore(end.value)) {
                end.value = time.add(const Duration(hours: 1));
              }
              start.value = time;
            },
          ),
        // end time picker
        if (isPickerExpanded.value == _IsPickerExpanded.endtime)
          TimeSelector(
            initialTime: end.value,
            onChange: (time) {
              if (!time.isAfter(start.value)) {
                start.value = time.subtract(const Duration(hours: 1));
              }
              end.value = time;
            },
          ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _TimeToggleButton extends StatelessWidget {
  const _TimeToggleButton({
    super.key,
    required this.timeFormat,
    required this.time,
    required this.isPickerExpanded,
    required this.whenExpand,
  });

  final DateFormat timeFormat;
  final DateTime time;
  final ValueNotifier<_IsPickerExpanded> isPickerExpanded;
  final _IsPickerExpanded whenExpand;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(350),
      renderBorder: false,
      isSelected: [
        (isPickerExpanded.value == whenExpand),
      ],
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(timeFormat.format(time),
              style: const TextStyle(fontSize: 16)),
        ),
      ],
      onPressed: (index) {
        if (isPickerExpanded.value != whenExpand) {
          isPickerExpanded.value = whenExpand;
        } else {
          isPickerExpanded.value = _IsPickerExpanded.collapse;
        }
      },
    );
  }
}

class _DateToggleButton extends StatelessWidget {
  const _DateToggleButton({
    required this.isPickerExpanded,
    required this.dateFormat,
    required this.date,
    required this.whenExpand,
  });

  final ValueNotifier<_IsPickerExpanded> isPickerExpanded;
  final _IsPickerExpanded whenExpand;
  final DateFormat dateFormat;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [(isPickerExpanded.value == whenExpand)],
      borderRadius: BorderRadius.circular(24),
      constraints: const BoxConstraints.tightForFinite(),
      renderBorder: false,
      onPressed: (index) {
        if (isPickerExpanded.value != whenExpand) {
          isPickerExpanded.value = whenExpand;
        } else {
          isPickerExpanded.value = _IsPickerExpanded.collapse;
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            dateFormat.format(date),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
