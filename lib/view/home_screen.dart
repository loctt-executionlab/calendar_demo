import 'package:demo_calendar/calendar/calendar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myCalendar = MyCalendar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const MonthlyCalendar(),
            TextButton(
                onPressed: () {
                  myCalendar.getCalendar();
                },
                child: const Text('Show event')),
            TextButton(
                onPressed: () {
                  myCalendar.signIn();
                },
                child: const Text('sign in')),
          ],
        ),
      ),
    );
  }
}
