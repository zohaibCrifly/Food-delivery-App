import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool onNext = false;
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'images/privacy-icon.png',
                    width: 76,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 135,
                  child: Text(
                    'Accept and Review FOS’s Privacy, Term & condition.',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          checkbox = !checkbox;
                          onNext = !onNext;
                        });
                      },
                      child: checkbox
                          ? Image.asset(
                              'images/check-box.png',
                              width: 30,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'images/box.png',
                              width: 20,
                            )),
                ),
                SizedBox(
                  width: checkbox ? 6 : 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 76,
                  child: RichText(
                    text: TextSpan(
                        text:
                            'By selecting "I afree" below, I have reviewed and agree to the',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                            text: ' privacy policy ',
                            style: Theme.of(context).textTheme.button,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("privacy policy");
                              },
                          ),
                          TextSpan(text: 'and acknowledge the'),
                          TextSpan(
                            text: ' terms & conditions',
                            style: Theme.of(context).textTheme.button,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("terms & conditions");
                              },
                          ),
                          TextSpan(text: '. I am at least 18 years of age'),
                        ]),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                NextButton(
                  onClicked: () => null,
                  // Navigator.of(context)
                  //     .push(AnimateRoute(page: const OTPVerification())),
                  isNext: onNext,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
