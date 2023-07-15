import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text; // login
  final Color textColor;
  final Color bgColor;
  const MyButton({super.key, required this.text, required this.textColor, required this.bgColor});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 200,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(color: widget.textColor),
        )),
      ),
    );
  }
}
