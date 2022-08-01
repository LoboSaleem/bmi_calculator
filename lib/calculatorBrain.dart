import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underWeight';
    }
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return 'The best way to lose weight if you\'re overweight is through a combination of diet and exercise.';
    } else if (_bmi > 18.5) {
      return 'Keep up the good work! For tips on maintaining a healthy weight, check out the food and diet and fitness sections.';
    } else {
      return 'Being underweight could be a sign you\'re not eating enough or you may be ill. If you\'re underweight, a GP can help.';
    }
  }
}
