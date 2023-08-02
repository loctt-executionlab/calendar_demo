import 'package:demo_calendar/view/login_drawer.dart';
import 'package:demo_calendar/widgets/monthy_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calendar'),
      ),
      drawer: const Drawer(
        child: SafeArea(
          child: LoginDrawer(),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MonthlyCalendar(),
            // TextButton(onPressed: () {}, child: const Text('Show event')),
            // TextButton(onPressed: () {}, child: const Text('log in')),
            // TextButton(onPressed: () {}, child: const Text('get client')),
          ],
        ),
      ),
    );
  }
}
