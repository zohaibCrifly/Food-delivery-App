import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_system/screen/opt_verifcation.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:food_ordering_system/screen/widgets/next_button.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({Key? key}) : super(key: key);

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  final InputText = TextEditingController();
  late String countryName;
  late String countryCode;

  bool onNext = false;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter your phone number',
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 110,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10)),
                        child: CountryCodePicker(
                          onChanged: (code) {
                            countryCode = code.dialCode!;
                            countryName = code.name!;
                          },

                          padding: const EdgeInsets.all(0),

                          showDropDownButton: true,
                          searchDecoration: const InputDecoration(
                            fillColor: Color(0xFFF5F5F5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                            ),
                          ),

                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'PK',
                          favorite: const ['+39', 'FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          hideMainText: false,
                          showFlagMain: true,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                          flagWidth: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: TextField(
                        //keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],

                        controller: InputText,
                        decoration: InputDecoration(
                          errorText: error ? 'Incorrect phone number' : null,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          hintText: '33333333333',
                          fillColor: const Color(0xFFF2F2F2),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        // ignore: non_constant_identifier_names
                        onChanged: (InputText) {
                          setState(() {
                            InputText.length < 7
                                ? onNext = false
                                : onNext = true;
                            InputText.length < 7 ? error = true : error = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                    'By continuing you may recieve an SMS for verification. Message and data rate may apply.',
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                NextButton(
                  onClicked: () => Navigator.of(context)
                      .push(AnimateRoute(page: const OTPVerification())),
                  isNext: onNext,
                  buttonText: 'Next',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
