import 'package:calendar_demo/theme/button_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
          ),
        ),
        title: const Text(
          "電話番号認証",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "電話番号を入力して認証コードを受け取りましょう",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "携帯電話番号",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                fillColor: const Color(0xfff6f5f1),
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "123123",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Color(0xffb2b2b2),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none),
              ),
              style: const TextStyle(fontSize: 15),
            ),
            TextButton(
              style: TextButtonStyles.filledButtonStyle(
                  Theme.of(context).primaryColor,
                  borderStyle: TextButtonStyleBorderStyle.rounded),
              onPressed: () {
                print("asdfasdf");
              },
              child: const Text(
                "認証コードを送信",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
