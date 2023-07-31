import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

class MyCalendar {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "314011855219-up6ilj41f4fcbc4hkhpu2tu41gk6lnfn.apps.googleusercontent.com",
    scopes: <String>[
      CalendarApi.calendarScope,
      CalendarApi.calendarEventsScope,
    ],
  );

  late CalendarApi calendar;

  Future<void> signIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "314011855219-up6ilj41f4fcbc4hkhpu2tu41gk6lnfn.apps.googleusercontent.com",
      scopes: <String>[
        CalendarApi.calendarScope,
        CalendarApi.calendarEventsScope,
      ],
    );
    await googleSignIn.signIn();
    final client = await googleSignIn.authenticatedClient();
    if (client != null) {
      calendar = CalendarApi(client);
    }
    print(googleSignIn.currentUser!.displayName);
  }

  Future<void> getCalendar() async {
    print('getting event');
    // print(googleSignIn.currentUser!.email);
    // final primary = await calendar.calendars.get("primary");
    // calendar.events.quickAdd("Primary", "test event!");
    final event = await calendar.events.list("primary");
    // final event = await calendar.events.list('"primary');

    if (event.items != null) {
      print('get event!');
      for (var element in event.items!) {
        print('meeting name ${element.description}');
      }
    }
  }
}
