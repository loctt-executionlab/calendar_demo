import 'package:demo_calendar/widgets/inline_datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetable/timetable.dart';

class AddScreen extends HookConsumerWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add event'),
        leading: const BackButton(),
        actions: [
          TextButton(onPressed: () {}, child: const Icon(Icons.punch_clock))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          const TextField(
            decoration: InputDecoration(
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
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          const InlineDatepicker()
        ],
      ),
    );
  }
}
