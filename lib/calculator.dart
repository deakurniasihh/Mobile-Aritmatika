import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: CalculatorAppHome(),
      ),
    );
  }
}

class CalculatorAppHome extends StatefulWidget {
  const CalculatorAppHome({super.key});

  @override
  State<CalculatorAppHome> createState() => _CalculatorAppHomeState();
}

class _CalculatorAppHomeState extends State<CalculatorAppHome> {
  String equation = '0';
  String result = '0';
  String expression = '';

  //function for button working

  // ...
  buttonPresed(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);

        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result; // Menambahkan hasil perhitungan ke dalam equation
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButtons(
      String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () {
        buttonPresed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btnText,
          style: TextStyle(
              color: txtColor, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // display equation value
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
                child: Text(
              equation,
              style: TextStyle(
                color: Color.fromARGB(255, 253, 251, 251),
                fontSize: 38,
              ),
            )),
          ),

          const SizedBox(
            height: 20,
          ),
          // display result
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 90,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
                child: Text(
              result,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
              ),
            )),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('AC', Colors.white, 80,
                        Color.fromARGB(255, 107, 105, 105)!),
                    calButtons('⌫', Colors.white, 80, Colors.white38!),
                    calButtons('%', Colors.white, 80, Colors.white38!),
                    calButtons('÷', Colors.white, 80,
                        Color.fromARGB(255, 116, 113, 117)!),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('7', Colors.white, 80, Colors.white10!),
                    calButtons('8', Colors.white, 80, Colors.white10!),
                    calButtons('9', Colors.white, 80, Colors.white10!),
                    calButtons('x', Colors.white, 80,
                        Color.fromARGB(255, 116, 113, 117)!),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('4', Colors.white, 80, Colors.white10!),
                    calButtons('5', Colors.white, 80, Colors.white10!),
                    calButtons('6', Colors.white, 80, Colors.white10!),
                    calButtons('-', Colors.white, 80,
                        Color.fromARGB(255, 116, 113, 117)!),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('1', Colors.white, 80, Colors.white10!),
                    calButtons('2', Colors.white, 80, Colors.white10!),
                    calButtons('3', Colors.white, 80, Colors.white10!),
                    calButtons('+', Colors.white, 80,
                        Color.fromARGB(255, 116, 113, 117)!),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('0', Colors.white, 170, Colors.white10!),
                    calButtons('9', Colors.white, 80, Colors.white10!),
                    calButtons('=', Colors.white, 80,
                        Color.fromARGB(255, 116, 113, 117)!),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
