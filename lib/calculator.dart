import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 40.0;
  double resultFontSize = 50.0;

  buttonPressed(String btnText) {
    setState(() {
      if (btnText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 40.0;
        resultFontSize = 50.0;
      } else if (btnText == "⌫") {
        equationFontSize = 40.0;
        resultFontSize = 50.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (btnText == "=") {
        equationFontSize = 40.0;
        resultFontSize = 50.0;

        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 50.0;
        resultFontSize = 40.0;
        if (equation == "0") {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => buttonPressed(btnText),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(75, 75),
        backgroundColor: btnColor,
        shape: CircleBorder(),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 30,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style:
                    TextStyle(fontSize: equationFontSize, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style:
                    TextStyle(fontSize: resultFontSize, color: Colors.white30),
              ),
            ),
            Expanded(child: Divider()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                numButton("⌫", Colors.black, Color.fromARGB(255, 231, 141, 141))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.white30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.white12, Colors.redAccent),
                numButton(
                    "(", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
                numButton(
                    ")", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
                numButton(
                    "÷", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", Colors.white12, Colors.lightBlueAccent),
                numButton("8", Colors.white12, Colors.lightBlueAccent),
                numButton("9", Colors.white12, Colors.lightBlueAccent),
                numButton(
                    "x", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", Colors.white12, Colors.lightBlueAccent),
                numButton("5", Colors.white12, Colors.lightBlueAccent),
                numButton("6", Colors.white12, Colors.lightBlueAccent),
                numButton(
                    "-", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", Colors.white12, Colors.lightBlueAccent),
                numButton("2", Colors.white12, Colors.lightBlueAccent),
                numButton("3", Colors.white12, Colors.lightBlueAccent),
                numButton(
                    "+", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton(
                    "%", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
                numButton("0", Colors.white12, Colors.lightBlueAccent),
                numButton(".", Colors.white12, Colors.lightBlueAccent),
                numButton(
                    "=", Color.fromARGB(255, 231, 141, 141), Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //logic
}
