import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(80, 80),
        backgroundColor: btnColor,
        shape: CircleBorder(),
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 30, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0321),
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color(0xff0a0321),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.white12, Colors.redAccent),
                numButton(
                    "( )", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
                numButton(
                    "%", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
                numButton(
                    "/", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
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
                    "X", Colors.white12, Color.fromARGB(255, 231, 141, 141)),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
