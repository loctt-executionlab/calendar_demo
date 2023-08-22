import 'package:demo_calendar/notifier/event_notifier.dart';
import 'package:demo_calendar/router/router.dart';
import 'package:demo_calendar/view/login_drawer.dart';
import 'package:demo_calendar/widgets/time_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calendar'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(eventNotifierProvider.notifier).tryRefetchEvent();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                context.goNamed(Routes.add.name);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const Drawer(
        child: SafeArea(
          child: LoginDrawer(),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: WeeklyTimetable(),
              ),
            ),
            // TextButton(onPressed: () {}, child: const Text('Show event')),
            // TextButton(onPressed: () {}, child: const Text('log in')),
            // TextButton(onPressed: () {}, child: const Text('get client')),
          ],
        ),
      ),
    );
  }
}
