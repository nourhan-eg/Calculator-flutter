import 'package:flutter/material.dart';
import 'calculator_screen.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:CalculatorScreen()
    );
  }
}