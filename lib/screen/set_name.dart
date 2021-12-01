import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_system/screen/privacy_policy.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool onNext = false;
  bool firstnameError = false;
  bool lastnameError = false;

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
                Text('What\'s your name?',
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 20,
                ),
                Text('Let us know how to properly address you',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                    ],
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      errorText: firstnameError ? 'Eneter first name' : null,
                      hintText: "Enter first name",
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
                    onChanged: (valuea) {
                      setState(() {
                        if (valuea == '') {
                          firstnameError = true;
                          onNext = false;
                        } else {
                          firstnameError = false;
                          if (!firstnameError && !lastnameError) {
                            onNext = true;
                          }
                        }
                      });
                    }),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                    ],
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      errorText: lastnameError ? 'Eneter last name' : null,
                      hintText: "Enter last name",
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
                    onChanged: (valueb) {
                      setState(() {
                        if (valueb == '') {
                          lastnameError = true;
                          onNext = false;
                        } else {
                          lastnameError = false;
                          if (!firstnameError && !lastnameError) {
                            onNext = true;
                          }
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
                      .push(AnimateRoute(page: const PrivacyPolicy())),
                  isNext: onNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
