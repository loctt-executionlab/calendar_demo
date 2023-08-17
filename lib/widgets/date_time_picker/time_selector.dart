import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    Key? key,
    required this.initialTime,
    required this.onChange,
  }) : super(key: key);

  final DateTime initialTime;
  final Function(DateTime time) onChange;

  static (int, int) _getHourWheelIndex(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute % 12;
    return (hour, minute);
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = 36.0;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: fontSize * 4.5, // = 3 item extend size
        child: Row(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: _ScrollSelector(
                initialIndex: _getHourWheelIndex(initialTime).$1,
                fontSize: fontSize,
                selectedItemCallback: (value) {
                  final newTime = initialTime.copyWith(hour: value);
                  onChange(newTime);
                },
                content: List<Widget>.generate(
                    24,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            index.toString().padLeft(2, '0'),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: fontSize,
                            ),
                          ),
                        )),
              ),
            ),
            const Flexible(
              child: Text(
                '\uFE30',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Flexible(
              child: _ScrollSelector(
                initialIndex: _getHourWheelIndex(initialTime).$2,
                selectedItemCallback: (value) {
                  final newTime = initialTime.copyWith(minute: value * 5);
                  onChange(newTime);
                },
                fontSize: fontSize,
                content: List<Widget>.generate(
                    12,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            (index * 5).toString().padLeft(2, '0'),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: fontSize,
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _ScrollSelector extends HookWidget {
  const _ScrollSelector({
    required this.fontSize,
    required this.content,
    required this.initialIndex,
    required this.selectedItemCallback,
  });

  final double fontSize;
  final List<Widget> content;
  final int initialIndex;
  final Function(int value) selectedItemCallback;
  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
        () => FixedExtentScrollController(initialItem: initialIndex));
    return ListWheelScrollView.useDelegate(
      overAndUnderCenterOpacity: 0.5,
      controller: controller,
      onSelectedItemChanged: selectedItemCallback,
      itemExtent: fontSize * 1.5,
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildLoopingListDelegate(children: content),
    );
  }
}
