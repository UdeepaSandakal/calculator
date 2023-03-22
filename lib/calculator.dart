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
      
  }
}
