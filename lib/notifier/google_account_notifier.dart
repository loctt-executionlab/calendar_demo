import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/subjects.dart';
part 'google_account_notifier.g.dart';

@Riverpod(keepAlive: true)
GoogleSignIn googleSignIn(GoogleSignInRef ref) {
  final instance = GoogleSignIn(
    clientId:
        "314011855219-up6ilj41f4fcbc4hkhpu2tu41gk6lnfn.apps.googleusercontent.com",
    scopes: <String>[
      CalendarApi.calendarScope,
      CalendarApi.calendarEventsScope,
    ],
  );
  instance.signInSilently();
  return instance;
}

@riverpod
BehaviorSubject<GoogleSignInAccount?> onGoogleAccountChange(
    OnGoogleAccountChangeRef ref) {
  final BehaviorSubject<GoogleSignInAccount?> stream = BehaviorSubject();
  ref.watch(googleSignInProvider).onCurrentUserChanged.listen((event) {
    stream.add(event);
  });
  return stream;
}

@riverpod
class GCalendarApi extends _$GCalendarApi {
  @override
  CalendarApi? build() {
    ref.watch(onGoogleAccountChangeProvider).listen((value) {
      final gAuthInstance = ref.watch(googleSignInProvider);
      gAuthInstance.authenticatedClient().then((client) {
        if (client == null) return;
        state = CalendarApi(client);
      });
    });
    return null;
  }
}
