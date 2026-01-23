import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/main.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController control = TextEditingController();

  double ANS = 0;
  void autosol() {
    setState(() {
      ANS = double.parse(result(control.text));
    });
  }

  int precedence(String c) {
    if (c == '+' || c == '-') return 1;
    if (c == '*' || c == '/' || c == '%') return 2;
    return 0;
  }

  String result(String exp) {
    List<double> operand = [];
    List<String> operator = [];
    for (int i = 0; i < exp.length; i++) {
      String c = exp[i];
      if (RegExp(r'\d').hasMatch(c)) {
        String number = c;

        // Collect consecutive digits
        while (i + 1 < exp.length && RegExp(r'\d').hasMatch(exp[i + 1])) {
          number += exp[i + 1];
          i++;
        }

        operand.add(double.parse(number));
      } else {
        while (operator.isNotEmpty &&
            precedence(operator.last) >= precedence(c)) {
          String op = operator.removeLast();
          double b = operand.removeLast();
          double a = operand.removeLast();
          operand.add(applyOperator(b, a, op));
        }
        operator.add(c);
      }
    }
    while (operator.isNotEmpty) {
      String op = operator.removeLast();
      double b = operand.removeLast();
      double a = operand.removeLast();
      operand.add(applyOperator(b, a, op));
    }
    return operand.last.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: TextField(
              controller: control,
              readOnly: false,
              decoration: InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.end,
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 2, 156, 252),
              cursorWidth: 2.5,
              cursorHeight: 75,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${ANS}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text = "";
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "AC",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text = control.text.substring(
                          0,
                          control.text.length - 1,
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "CL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        print("+/-");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "+/-",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "/";
                        autosol();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "/",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "7";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "7",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "8";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "8",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "9";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "9",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "*";
                        autosol();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "*",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "4";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "4",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "5";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "6";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "6",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "-";
                        autosol();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "-",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "1";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "2";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "3";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "+";
                        autosol();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          72,
                          161,
                          229,
                        ),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "%";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += "0";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        control.text += ".";
                        autosol();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          83,
                          180,
                          255,
                        ),
                      ),
                      child: Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double applyOperator(double b, double a, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a / b;
      case '%':
        return a % b;
    }
    return 0;
  }
}
