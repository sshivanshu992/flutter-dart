import 'dart:math';

class CalculateBMI {
  final double height;
  final double weight;
  CalculateBMI(this.height, this.weight);

  double _resultOfBMI = 0;
  String calculate() {
    _resultOfBMI = weight / pow(height / 100, 2);
    return _resultOfBMI.toStringAsFixed(1);
  }

  String getRange() {
    String result = '';
    if (_resultOfBMI < 18.5) {
      result = "Under Weight BMI Range:\n Less 18.5 Kg/m2";
    }
    if (_resultOfBMI > 18.5 && _resultOfBMI <= 24.9) {
      result = "Normal BMI Range:\n 18,5 - 25 Kg/m2";
    }
    if (_resultOfBMI >= 25 && _resultOfBMI <= 29.9) {
      result = "Over weight BMI Range:\n 25 - 30 Kg/m2";
    }
    if (_resultOfBMI > 30 && _resultOfBMI <= 39.9) {
      result = "Obesity BMI Range:\n 30 - 40 Kg/m2";
    }
    if (_resultOfBMI >= 40) {
      result = "Severe Obesity BMI Range:\n More Then 40 Kg/m2";
    }
    return result;
  }

  String getResult() {
    String result = 'Normal';

    if (_resultOfBMI < 18.5) result = 'UNDER WEIGHT';
    if (_resultOfBMI > 18.5 && _resultOfBMI <= 24.9) result = 'NORMAL';
    if (_resultOfBMI >= 25 && _resultOfBMI <= 29.9) result = 'OVERWEIGHT';
    if (_resultOfBMI > 30 && _resultOfBMI <= 39.9) result = 'OBESITY';
    if (_resultOfBMI >= 40) result = 'SEVERE OBESITY';
    return result;
  }

  String getNarration() {
    String result = '';

    if (_resultOfBMI < 18.5) {
      result = 'You are currently under weight, Eat Healthy Food';
    }
    if (_resultOfBMI > 18.5 && _resultOfBMI <= 24.9) {
      result = 'Your BMI is normal, Maintain the Same Diet';
    }
    if (_resultOfBMI >= 25 && _resultOfBMI <= 29.9) {
      result = 'Oops! Your BMI states slightly Over Weight, Eat Healthy Food';
    }
    if (_resultOfBMI > 30 && _resultOfBMI <= 39.9) {
      result =
          'Oops! Your BMI States Obesity, Avoid Junk Food and Eat Healthy Food';
    }
    if (_resultOfBMI >= 40) {
      result =
          'Oops!, You BMI States Severe Obesity, Avoid Junk Food else you will die';
    }
    return result;
  }
}
