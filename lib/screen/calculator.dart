import 'package:calculator_x/constants/Colors.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool shouldReset = false; // New flag to reset output when needed

  buttonpressed(String buttontext) {
    if (buttontext == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      shouldReset = false;
    } else if (buttontext == "+" || buttontext == "-" || buttontext == "x" || buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
      shouldReset = false; // Don't reset when entering an operator
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already a decimal exists");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      shouldReset = true; // Set flag to reset on next number input
    } else {
      if (shouldReset) {
        _output = buttontext; // Replace output if a new number is entered
        shouldReset = false;
      } else {
        _output = _output + buttontext;
      }
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }


  Widget PressButton(String buttontext){
    return
      Expanded(
        child: OutlinedButton(
          child: Text(buttontext,
            style: TextStyle(
              fontSize: 20,

            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: numberButtonColor,
              padding: EdgeInsets.symmetric(vertical: 35, horizontal: buttontext == "00" ? 20 : 35),

            shape: RoundedRectangleBorder(
              borderRadius:   BorderRadius.circular(10),
            )// Add padding
          ),
          onPressed:()=> buttonpressed(buttontext)

        ),
      );
  }

  Widget OperatorButton(String buttontext){
    return
      Expanded(
        child: OutlinedButton(
            onPressed:()=> buttonpressed(buttontext),
          style: OutlinedButton.styleFrom(
              backgroundColor: operatorButtonColor,
              padding: EdgeInsets.all(35),
              shape: RoundedRectangleBorder(
                borderRadius:   BorderRadius.circular(10),
              )// Add padding
          ),
          child: Text(buttontext,
            style: TextStyle(
              fontSize: 20,

            ),
          ),
        ),
      );
  }

  Widget EqualButton(String buttontext){
    return
      Expanded(

        child: OutlinedButton(
            onPressed:()=> buttonpressed(buttontext),
          style: OutlinedButton.styleFrom(
              backgroundColor: equalButtonColor,
              padding: EdgeInsets.all(35),
              shape: RoundedRectangleBorder(
                borderRadius:   BorderRadius.circular(10),
              )// Add padding
          ),

          child: Text(buttontext,
            style: TextStyle(
              fontSize: 20,

            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: displayBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                  child: Text("$output",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: displayTextColor,
                  ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: buttonBackgroundColor,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                      PressButton("7"),
                        PressButton("8"),
                        PressButton("9"),
                        OperatorButton("+"),
                      ],
                    ),
                    Row(
                      children: [
                        PressButton("4"),
                        PressButton("5"),
                        PressButton("6"),
                        OperatorButton("-"),
                      ],
                    ),
                    Row(
                      children: [
                        PressButton("1"),
                        PressButton("2"),
                        PressButton("3"),
                        OperatorButton("x"),
                      ],
                    ),
                    Row(
                      children: [
                        PressButton("."),
                        PressButton("0"),
                        PressButton("00"),
                        OperatorButton("/"),
                      ],
                    ),
                    Row(
                      children: [
                        OperatorButton("Clear"),
                        EqualButton("="),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
