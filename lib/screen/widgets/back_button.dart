import 'package:flutter/material.dart';

class BackButton extends StatefulWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[200],
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
      ),
      onPressed: () {
        // Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ),
      //color: Colors.grey[200],
    );
  }
}
