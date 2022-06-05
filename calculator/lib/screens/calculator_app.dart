import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.white),
          title: const Text('Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: 'AC', callback: btnOnClick),
                  CalculatorButton(text: 'C', callback: btnOnClick),
                  CalculatorButton(text: '<', callback: btnOnClick),
                  CalculatorButton(text: '/', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '7', callback: btnOnClick),
                  CalculatorButton(text: '8', callback: btnOnClick),
                  CalculatorButton(text: '9', callback: btnOnClick),
                  CalculatorButton(text: '*', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '4', callback: btnOnClick),
                  CalculatorButton(text: '5', callback: btnOnClick),
                  CalculatorButton(text: '6', callback: btnOnClick),
                  CalculatorButton(text: '-', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '1', callback: btnOnClick),
                  CalculatorButton(text: '2', callback: btnOnClick),
                  CalculatorButton(text: '3', callback: btnOnClick),
                  CalculatorButton(text: '+', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '-/+', callback: btnOnClick),
                  CalculatorButton(text: '0', callback: btnOnClick),
                  CalculatorButton(text: '00', callback: btnOnClick),
                  CalculatorButton(text: '=', callback: btnOnClick),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void btnOnClick(String btnValue) {
    print(btnValue);
  }
}
