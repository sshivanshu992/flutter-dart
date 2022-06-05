import 'package:flutter/material.dart';

class CardManage extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;
  final VoidCallback onPress;

  const CardManage(
      {Key? key,
      required this.bgColor,
      required this.cardChild,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
