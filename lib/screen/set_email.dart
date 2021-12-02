import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/set_password.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool onNext = false;
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
                Text('What\'s your email address?',
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 20,
                ),
                Text('Reciepts will be sent to your email',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      errorText: error ? 'Enter a valid email address' : null,
                      hintText: "Enter your email",
                      fillColor: Color(0xFFF2F2F2),
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
                        RegExp reg = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$");
                        if (reg.hasMatch(value) && value != '') {
                          error = false;
                          onNext = true;
                        } else {
                          onNext = false;
                          error = true;
                        }
                      });
                    }),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                NextButton(
                  onClicked: () => Navigator.of(context)
                      .push(AnimateRoute(page: const SetPassword())),
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
