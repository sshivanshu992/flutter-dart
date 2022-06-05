import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color isActiveColor;
  final VoidCallback onPressed;

  const RoundIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.isActiveColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 45.0, height: 45.0),
      shape: const CircleBorder(),
      fillColor: roundedIconBackgroundColor,
      child: Icon(
        icon,
        color: isActiveColor,
      ),
    );
  }
}
