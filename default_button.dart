import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.height = 50,
    this.width = double.infinity,
    this.fontSize = 20,
    this.letterSpacing = 1.2,
    this.fontWeight = FontWeight.normal,
    this.gradientColors = const [
      Color(0xFF052072),
      Color(0xFF02102E),
    ],
  }) : super(key: key);
  final double height;
  final double width;
  final String text;
  final VoidCallback press;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final List<Color> gradientColors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              )),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
