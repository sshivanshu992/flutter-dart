import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/constants.dart';
import 'package:flutter_application_3/widgets/bottom_botton_widgets.dart';
import 'package:flutter_application_3/widgets/card_widgets.dart';

class ResultOfBMI extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String bmiNarration;
  final String bmiRange;
  const ResultOfBMI({
    Key? key,
    required this.bmi,
    required this.bmiResult,
    required this.bmiNarration,
    required this.bmiRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 5,
          toolbarHeight: 60,
          centerTitle: true,
          shadowColor: headerShadowColor,
          backgroundColor: backgroundColor,
          leading: const Icon(
            Icons.health_and_safety_outlined,
            size: 40,
          ),
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0),
          ),
        ),
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 0),
                  child: Text(
                    'YOUR RESULT',
                    style: largeTextStyleLable,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CardManage(
                  bgColor: cardBackgroundColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiResult,
                        style: resultTextStyleLable,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmi,
                        style: numberStyleLable,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmiRange,
                        style: textStyleLable,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmiNarration,
                        style: textStyleLable,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  onPress: () {},
                ),
              ),
              Expanded(
                  child: BottomButton(
                buttonText: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ))
            ],
          ),
        ));
  }
}
