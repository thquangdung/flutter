import 'dart:ui';

import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';

import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

const darkColor = 0x331E90FF;
const lightColor = 0xFFFFFFFF;

class CalcApp extends StatefulWidget {
  CalcApp({Key key}):super(key: key);

  @override
  CalcAppState createState()=> CalcAppState();
}

class CalcAppState extends State<CalcApp> {

  String _history = '';
  String _expression = '';

  void numberClick (String text) {
    setState(() {
      _expression +=text;
    });
  }

  void clearAll (String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear (String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate (String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
            Container (
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment(1, 1),
              child: Text (
                _history,
                style: TextStyle (
                  fontSize: 24,
                  color: Color(darkColor),
                ),
              ),
            ),
            Container (
              padding: EdgeInsets.all(15),
              alignment: Alignment(1, 1),
              child: Text (
                _expression,
                style: TextStyle (
                  fontSize: 48,
                  color: Color(lightColor),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton ( text: 'AC', fillColor: darkColor, textColor: lightColor, callback: clearAll ),
                CalcButton ( text: 'C', fillColor: darkColor, textColor: lightColor, callback: clear ),
                CalcButton ( text: '%', fillColor: lightColor, callback: numberClick ),
                CalcButton ( text: '/', fillColor: lightColor, callback: numberClick )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton ( text: '7', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '8', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '9', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '*', fillColor: lightColor, callback: numberClick )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton ( text: '4', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '5', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '6', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '-', fillColor: lightColor, callback: numberClick )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton ( text: '1', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '2', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '3', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '+', fillColor: lightColor, callback: numberClick )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CalcButton ( text: ',', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '0', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '00', textColor: lightColor, callback: numberClick ),
                CalcButton ( text: '=', fillColor: lightColor, callback: evaluate )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

