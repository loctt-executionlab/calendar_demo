import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OTPView extends HookConsumerWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txt1 = useTextEditingController();
    final txt2 = useTextEditingController();
    final txt3 = useTextEditingController();
    final txt4 = useTextEditingController();
    // final otpController = useMemoized(() => OtpFieldController());
    final focus1 = useFocusNode();
    final focus2 = useFocusNode();
    final focus3 = useFocusNode();
    final focus4 = useFocusNode();

    useMemoized(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("asdfasdf"),
      ),
      body: ListView(
        children: [
          // OTPTextField(
          //   contentPadding: EdgeInsets.all(12),
          //   controller: otpController,
          //   length: 4,
          // ),
          OtpTextField(
            numberOfFields: 4,
            onCodeChanged: (value) {
              print(value);
            },
            handleControllers: (controllers) {},
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: txt1,
                focusNode: focus1,
                maxLength: 1,
                onChanged: (value) {
                  focus2.requestFocus();
                },
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: TextField(
                controller: txt2,
                focusNode: focus2,
                maxLength: 1,
                onChanged: (value) {
                  focus3.requestFocus();
                },
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: SelectionContainer.disabled(
                child: TextField(
                  enableInteractiveSelection: false,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                  controller: txt3,
                  onTap: () {
                    txt3.selection = TextSelection(
                        baseOffset: txt3.text.length,
                        extentOffset: txt3.text.length);
                  },
                  focusNode: focus3,
                  maxLength: 1,
                  onChanged: (value) {
                    focus4.requestFocus();
                  },
                ),
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: TextField(
                controller: txt4,
                focusNode: focus4,
                maxLength: 1,
                onTap: () {},
                onChanged: (value) {},
              )),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
