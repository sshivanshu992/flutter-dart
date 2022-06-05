import 'package:flutter/material.dart';

class IconManage extends StatelessWidget {
  final IconData icon;
  final Color isActiveColor;
  final String iconText;

  const IconManage(
      {Key? key,
      required this.icon,
      required this.iconText,
      required this.isActiveColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 60, color: isActiveColor),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          iconText,
          style: TextStyle(
              fontSize: 18, color: isActiveColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
