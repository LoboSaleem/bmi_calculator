import 'package:bmi_calculator/BottomButton.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/constants.dart';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmiAdvice,
      required this.bmiCount,
      required this.bmiResult});

  final String bmiCount;
  final String bmiResult;
  final String bmiAdvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALC'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Expanded(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Your Result',
                style: lNumberTextStyle,
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult,
                        style: lResultTextStyle,
                      ),
                      Text(
                        bmiCount,
                        style: lResultNumberStyle,
                      ),
                      Text(
                        bmiAdvice,
                        style: lResultInfoStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              BottomButton(
                buttonTitle: 'Try Again',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
