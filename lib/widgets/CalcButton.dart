import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {

  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton ({
    Key key,
    this.text,
    this.fillColor = 0x00FFFFFF,
    this.textColor = 0xFF008000,
    this.textSize = 24,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SizedBox (
        width: 65,
        height: 65,
        child: FlatButton (
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          child: Text (
            text,
            style: GoogleFonts.gochiHand(textStyle: TextStyle (fontSize: textSize)),
          ),
          color: fillColor != null ? Color (fillColor) : null,
          textColor: Color (textColor),
          onPressed: () {
            callback(text);
          },
        ),
      ),
    );

  }
}

