import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var myController = TextEditingController();
  final _result = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.calculate),
        title: const Text('Calculator'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 222, 241),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0),
            child: TextField(
              // focusNode: FocusNode(),
              // enableInteractiveSelection: false,
              controller: myController,
              enabled: false,
              maxLines: 5,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '/';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '/',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              // for move space
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '*',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '.',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  'C',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '7';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '7',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              // for move space
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '8';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '8',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '9';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '9',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '+';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '4';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '4',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              // for move space
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '5';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '5',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '6';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '6',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '-';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '-',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '1';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              // for move space
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '2';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text += '3';
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              //for move space
              const SizedBox(
                width: 10.0,
                height: 10.0,
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    myController.text = _result.toString();
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(75.0, 75.0),
                ),
                child: const Text(
                  '=',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
