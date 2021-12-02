import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_system/screen/set_email.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late bool onNext = false;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify your phone number',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter the 4-digit code sent to you at 333 333333',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(5),
                    ],
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      errorText: error ? 'Invalid OTP' : null,
                      hintText: "Enter the OTP code",
                      fillColor: const Color(0xFFF2F2F2),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        value.length == 5 ? onNext = true : onNext = false;
                        value.length == 5 ? error = false : error = true;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Text('Resend code via SMS',
                      style: Theme.of(context).textTheme.button),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                NextButton(
                  onClicked: () => Navigator.of(context)
                      .push(AnimateRoute(page: const EmailScreen())),
                  isNext: onNext,
                  buttonText: 'Next',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
