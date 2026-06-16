import 'package:flutter/material.dart';

import 'button_item.dart';

class CalculatorScreen extends StatefulWidget{
  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result="";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        title: Text("Calculator" ,style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 65),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonItem(label: "AC", onClick:(label) {
                  result = "";
                  lhs = "";
                  rhs = "";
                  operator = "";
                  setState(() {});

                }, background_color:Color(0xFF616161) ),
                ButtonItem(label: "C",
                    onClick: (label) {
                      if (result.isNotEmpty) {
                        result = result.substring(0, result.length - 1);
                        setState(() {});
                      }
                    }, background_color:Color(0xFF616161) ,is_icon: true),
                ButtonItem(label: "/",onClick:onOperatorClicked, background_color:Color(0xFF005DB2) ),
                ButtonItem(label: "*",onClick:onOperatorClicked, background_color:Color(0xFF005DB2) )
              ],

            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonItem(label: "7", onClick: onDigitClick, background_color: Color(0xFF424242),text_color:Color(0xFF005DB2) ),
                ButtonItem(label: "8", onClick: onDigitClick, background_color: Color(0xFF424242) ,text_color:Color(0xFF005DB2)),
                ButtonItem(label: "9", onClick: onDigitClick, background_color: Color(0xFF424242),text_color:Color(0xFF005DB2)),
                ButtonItem(label: "-", onClick: onOperatorClicked, background_color:Color(0xFF005DB2) )
              ],

            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonItem(label: "4", onClick: onDigitClick, background_color: Color(0xFF424242) ,text_color:Color(0xFF005DB2) ),
                ButtonItem(label: "5", onClick: onDigitClick, background_color: Color(0xFF424242) ,text_color:Color(0xFF005DB2)),
                ButtonItem(label: "6", onClick: onDigitClick, background_color: Color(0xFF424242) ,text_color:Color(0xFF005DB2)),
                ButtonItem(label: "+", onClick: onOperatorClicked, background_color:Color(0xFF005DB2) )
              ],

            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonItem(label: "1", onClick: onDigitClick, background_color: Color(0xFF424242),text_color:Color(0xFF005DB2) ),
                ButtonItem(label: "2", onClick: onDigitClick, background_color: Color(0xFF424242) ,text_color:Color(0xFF005DB2)),
                ButtonItem(label: "3", onClick: onDigitClick, background_color: Color(0xFF424242),text_color:Color(0xFF005DB2)),
                ButtonItem(label: "%", onClick: onOperatorClicked, background_color:Color(0xFF005DB2) ),
              ],

            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ButtonItem(label: "0", onClick: onDigitClick,background_color: Color(0xFF424242), text_color: Color(0xFF005DB2)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ButtonItem(label: ".",onClick: onDigitClick ,background_color: Color(0xFF424242), text_color: Color(0xFF005DB2)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ButtonItem(label: "=", onClick: onEqualClick, background_color: Color(0xFF005DB2)),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),


    );

  }
  String lhs = "";
  String operator = "";
  String rhs = "";

  String calculate(String lhs ,String operator ,String rhs){
    final double LHS = double.tryParse(lhs)??0;
    final double RHS = double.tryParse(rhs)??0;
    double result = 0;
    switch(operator){
      case "+":
        result = LHS + RHS;
        break;
      case "-":
        result = LHS - RHS;
        break;
      case "/":
        if(RHS==0) return "error";
        result = LHS / RHS;
        break;
      case "*":
        result = LHS * RHS;
        break;
      case "%":
        if (RHS == 0) return "error";
        result = LHS % RHS;
        break;

      default:
        return rhs;

    }
    return _format(result);

  }
  onOperatorClicked(label){
    if(result.isEmpty){
      if(lhs.isNotEmpty){
        operator = label ;
        setState(() {});
        return ;
      }
    }
    if(operator.isEmpty||operator=="="){
      lhs = result;
    }
    else{
      rhs = result;
      lhs = calculate(lhs , operator , rhs);
    }
    operator = label;
    result = "";
    setState(() {});

  }
  onDigitClick(label){
    if(operator=="="){
      result = "";
      operator = "";
    }
    if (label == "." && result.contains(".")) return;
    if (label == "." && result.isEmpty) result = "0";
    result += label;
    setState(() {});

  }

  onEqualClick(label){
    rhs = result;
    lhs = calculate(lhs , operator , rhs);
    operator = label ;
    result = lhs;
    lhs = "";
    rhs = "";
    setState(() {});

  }

  String _format(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    return value.toString();
  }
}
