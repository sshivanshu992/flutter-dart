import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  // final int fillColor;
  // final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton({
    Key? key,
    required this.text,
    // required this.fillColor,
    required this.callback,
    // required this.textColor,
    this.textSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 60,
        height: 60,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 184, 193, 201),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),

            ///his kind of override is common; however,
            ///in many cases what’s also needed are overrides for
            /// the overlay colors that the text button uses to indicate
            /// its hovered/focus/pressed state. This can be done by adding
            /// the overlayColor property to the ButtonStyle.
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.black54.withOpacity(0.04);
                }
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return Colors.grey.withOpacity(0.12);
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
