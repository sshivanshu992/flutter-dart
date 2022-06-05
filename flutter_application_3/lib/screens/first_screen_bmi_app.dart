import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/result_screen_of_bmi.dart';
import 'package:flutter_application_3/services/calculate_bmi.dart';
import 'package:flutter_application_3/utils/constants.dart';
import 'package:flutter_application_3/widgets/bottom_botton_widgets.dart';
import 'package:flutter_application_3/widgets/card_widgets.dart';
import 'package:flutter_application_3/widgets/icon_widgets.dart';
import 'package:flutter_application_3/widgets/round_icon_button_widgets.dart';

enum GenderType { male, female }

class BmiApplication extends StatefulWidget {
  const BmiApplication({Key? key}) : super(key: key);

  @override
  State<BmiApplication> createState() => _BmiApplicationState();
}

class _BmiApplicationState extends State<BmiApplication> {
  GenderType selectedGender = GenderType.male;

  double height = 150;
  int age = 18;
  double weight = 65;

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
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: SizedBox(
                height: 150,
                // width: double.infinity,
                child: CardManage(
                    bgColor: cardBackgroundColor,
                    cardChild: IconManage(
                        icon: Icons.male,
                        iconText: 'MALE',
                        isActiveColor: selectedGender == GenderType.male
                            ? activeColor
                            : inActiveColor),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    }),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: CardManage(
                    bgColor: cardBackgroundColor,
                    cardChild: IconManage(
                        icon: Icons.female,
                        iconText: 'FEMALE',
                        isActiveColor: selectedGender == GenderType.female
                            ? activeColor
                            : inActiveColor),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    }),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: SizedBox(
                height: 180,
                // width: double.infinity,
                child: CardManage(
                    bgColor: lCardBackgroundColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT', style: subHeaderStyleLable),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toStringAsFixed(1),
                              style: numberStyleLable,
                            ),
                            const Text(
                              'cm',
                              style: textStyleLable,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: sliderActiveColor,
                            inactiveTrackColor: sliderInActiveColor,
                            trackShape: const RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: sliderThumbColor,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0),
                            overlayColor: sliderThumbColor.withAlpha(60),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 28.0),
                          ),
                          child: Slider(
                              value: height,
                              min: 100.0,
                              max: 250.0,
                              onChanged: (newValue) {
                                setState(() {
                                  height = newValue;
                                });
                              }),
                        )
                      ],
                    ),
                    onPress: () {}),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: CardManage(
                        bgColor: lCardBackgroundColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: subHeaderStyleLable,
                            ),
                            Text('$weight', style: numberStyleLable),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 10) weight--;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        if (weight < 150) weight++;
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: CardManage(
                          bgColor: lCardBackgroundColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('AGE', style: subHeaderStyleLable),
                              Text('$age', style: numberStyleLable),
                              Row(children: [
                                Expanded(
                                  child: RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        setState(() {
                                          if (age > 0) age--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ),
                              ])
                            ],
                          ),
                          onPress: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          BottomButton(
              buttonText: 'CALCULATE BMI',
              onTap: () {
                var bmi = CalculateBMI(height, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultOfBMI(
                      bmi: bmi.calculate(),
                      bmiResult: bmi.getResult(),
                      bmiNarration: bmi.getNarration(),
                      bmiRange:bmi.getRange(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
