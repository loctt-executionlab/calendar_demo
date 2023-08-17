import 'package:demo_calendar/models/event.dart';
import 'package:demo_calendar/notifier/event_notifier.dart';
import 'package:demo_calendar/widgets/date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetable/timetable.dart';

class AddScreen extends HookConsumerWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameTxtController = useTextEditingController();
    final initialTime = DateTime.now();
    final start = useValueNotifier(
      initialTime
          .roundTimeToMultipleOf(const Duration(minutes: 5))
          .copyWith(isUtc: true),
    );
    final end = useValueNotifier(initialTime
        .roundTimeToMultipleOf(const Duration(minutes: 5))
        .add(
          const Duration(hours: 1),
        )
        .copyWith(isUtc: true));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add event'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                TextField(
                  controller: nameTxtController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 24,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                DateTimePicker(
                  start: start,
                  end: end,
                )
              ],
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                IconButton(
                    onPressed: () async {
                      final event = CalendarEvent(
                        id: '',
                        name: nameTxtController.text,
                        start: start.value,
                        end: end.value,
                      );
                      await ref
                          .read(eventNotifierProvider.notifier)
                          .addEvent(event);
                      return;
                    },
                    icon: const Icon(Icons.done))
              ],
            ),
          )
        ],
      ),
    );
  }
}
