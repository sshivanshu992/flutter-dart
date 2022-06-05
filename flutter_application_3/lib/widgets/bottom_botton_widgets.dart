import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const BottomButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: bottomContainerColor,
        height: bottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8.0),
        
        child: Center(
          child: Text(
            buttonText,
            style: largeTextStyleLable,
            
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
