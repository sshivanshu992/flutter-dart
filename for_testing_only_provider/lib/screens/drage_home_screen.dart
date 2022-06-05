import 'package:flutter/material.dart';

class SliderHomeScreen extends StatefulWidget {
  const SliderHomeScreen({Key? key}) : super(key: key);

  @override
  State<SliderHomeScreen> createState() => _SliderHomeScreenState();
}

class _SliderHomeScreenState extends State<SliderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('This is my Slider details'),
          Slider(
            value: context.watch<SliderHomeScreen>().slide,
            min: 0,
            max: 100,
            onChanged: (val) {
              setState(() {
                l = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
