import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/set_name.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool passwordvisible = true;
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
                  Text('Create your account password',
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Your password must be at least 8 character long and contain at least one letter and one digit',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: passwordvisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        errorText: error
                            ? 'Password must be 8 character long\n Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character\nCommon Allow Character ( ! @ # \$ & * ~ )'
                            : null,
                        hintText: "Enter your password",
                        fillColor: const Color(0xFFF2F2F2),
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordvisible = !passwordvisible;
                            });
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFF797979),
                          ),
                        )),
                    onChanged: (value) {
                      setState(() {
                        RegExp reg = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (reg.hasMatch(value) && value != '') {
                          error = false;
                          onNext = true;
                        } else {
                          onNext = false;
                          error = true;
                        }
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  NextButton(
                    onClicked: () => Navigator.of(context)
                        .push(AnimateRoute(page: const NameScreen())),
                    isNext: onNext,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
