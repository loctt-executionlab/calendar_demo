import 'package:calendar_demo/calendar/domains/model/models.dart';
import 'package:calendar_demo/calendar/notifiers/device_calendar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/timezone.dart';

class NewEventView extends HookConsumerWidget {
  const NewEventView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventName = useTextEditingController();
    final calendars = ref.watch(
        deviceCalendarNotifierProvider.select((value) => value.calendars));
    final start = useValueNotifier(DateTime.now());
    final end = useValueNotifier(DateTime.now());
    final selectedCalendar = useValueNotifier<Calendar?>(null);
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: eventName,
          ),
          TextButton(
              onPressed: () async {
                start.value = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 1000)),
                    ) ??
                    DateTime.now();
              },
              child: const Text("start date")),
          TextButton(
              onPressed: () async {
                end.value = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 1000)),
                    ) ??
                    DateTime.now();
              },
              child: const Text("end date")),
          ...calendars.map((e) => TextButton(
                onPressed: (e.isReadOnly ?? true)
                    ? null
                    : () {
                        selectedCalendar.value = e;
                      },
                child: Text(e.name ?? "unknown"),
              )),
          ValueListenableBuilder(
            valueListenable: selectedCalendar,
            builder: (context, value, child) => ElevatedButton(
                onPressed: (value != null)
                    ? () {
                        ref
                            .read(deviceCalendarNotifierProvider.notifier)
                            .setEvent(Event(
                              calendarId: selectedCalendar.value?.calendarId,
                              title: eventName.text,
                              dateStarted: TZDateTime.from(
                                  start.value, getLocation("US/Pacific")),
                              dateEnded: TZDateTime.from(
                                  end.value, getLocation("US/Pacific")),
                              // dateStarted:
                            ));
                      }
                    : null,
                child: const Text("Add event")),
          ),
          ElevatedButton(
              onPressed: () {
                ref.refresh(deviceCalendarNotifierProvider);
              },
              child: const Text("Refresh")),
        ],
      ),
    );
  }
}
