import 'package:flutter/material.dart';
import 'colors_const.dart';

class buttonBorder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  buttonBorder(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: cwhiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // This is your border radius
            side: BorderSide(color: caccentColor), // This is your border color
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: caccentColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  button({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: cwhiteColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
