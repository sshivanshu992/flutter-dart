import 'package:flutter/material.dart';
import 'package:life_cycle_state_24/services/service_of_calculator.dart';

class CalculatorOnlyForAddMult extends StatefulWidget {
  const CalculatorOnlyForAddMult({Key? key}) : super(key: key);

  @override
  State<CalculatorOnlyForAddMult> createState() =>
      _CalculatorOnlyForAddMultState();
}

class _CalculatorOnlyForAddMultState extends State<CalculatorOnlyForAddMult> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var resultController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator App'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: no1Controller,
                decoration: const InputDecoration(
                    labelText: 'Enter No1', hintText: 'Enter Value for No1'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: no2Controller,
                decoration: const InputDecoration(
                    labelText: 'Enter No2', hintText: 'Enter Value for No2'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: resultController,
                enabled: false,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (() {
                      resultController.text = Calculator()
                          .sum(int.parse(no1Controller.text),
                              int.parse(no2Controller.text))
                          .toString();
                    }),
                    child: const Text('Add'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: (() {
                      resultController.text = Calculator()
                          .mul(int.parse(no1Controller.text),
                              int.parse(no2Controller.text))
                          .toString();
                    }),
                    child: const Text('Multiply'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
