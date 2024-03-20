import 'package:calendar_demo/calendar/notifiers/device_calendar_notifier.dart';
import 'package:calendar_demo/calendar/views/login_view.dart';
import 'package:calendar_demo/calendar/views/monthly_calendar.dart';
import 'package:calendar_demo/calendar/views/new_event.dart';
import 'package:calendar_demo/calendar/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OTPView(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: ListView(
        children: [
          const MonthlyCalendar(),
          ElevatedButton(
              onPressed: () async {
                final permit = await ref
                    .read(deviceCalendarNotifierProvider.notifier)
                    .requestPermission();
                if (!permit) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewEventView(),
                    ));
              },
              child: const Text("add events")),
        ],
      ),
    );
  }
}
