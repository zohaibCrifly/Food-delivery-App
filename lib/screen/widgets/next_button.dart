import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onClicked;
  final bool isNext;
  final String buttonText;
  const NextButton({
    Key? key,
    required this.onClicked,
    required this.isNext,
    required this.buttonText,
  }) : super(key: key);

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    // bool nextfalse = widget.isNext;
    return
        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       nextfalse = false;
        //     });
        //   },
        //   child:
        ElevatedButton(
      onPressed: widget.isNext ? widget.onClicked : () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        primary:
            widget.isNext ? const Color(0xFFFB6D3A) : const Color(0xFFFDAF93),
        //(0xFFFDAF93),
      ),
      child: Row(
        children: [
          Text(
            widget.buttonText,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      // ),
    );
  }
}
