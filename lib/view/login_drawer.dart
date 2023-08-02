import 'package:demo_calendar/notifier/google_account_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginDrawer extends ConsumerWidget {
  const LoginDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            ref.read(googleSignInProvider).signIn().then((value) {
              print('login result $value');
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
