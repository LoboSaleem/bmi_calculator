import 'dart:ui';

import 'BottomButton.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'result_page.dart';
import 'RoundIconButton.dart';
import 'package:bmi_calculator/calculatorBrain.dart';

enum Gender {
  male,
  female,
  ande,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.ande;
  int height = 180;
  int weight = 60;
  int age = 25;
  // Color maleCardColour = inActiveCardColor;
  // Color famaleCardColour = inActiveCardColor;
  //
  // void updateColour(GenderType selectedGender) {
  //   if (selectedGender == GenderType.male) {
  //     if (maleCardColour == inActiveCardColor) {
  //       maleCardColour = activeCardColor;
  //       famaleCardColour = inActiveCardColor;
  //     } else {
  //       maleCardColour = inActiveCardColor;
  //     }
  //   }
  //   if (selectedGender == GenderType.female) {
  //     if (famaleCardColour == inActiveCardColor) {
  //       famaleCardColour = activeCardColor;
  //       maleCardColour = inActiveCardColor;
  //     } else {
  //       famaleCardColour = inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        iconReImage: FontAwesomeIcons.mars,
                        iconReText: 'Man',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        iconReImage: FontAwesomeIcons.venus,
                        iconReText: 'Woman',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: lNumberTextStyle,
                      ),
                      Text('cm', style: labelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      /*
                      thumbShape: RoundSliderOverlayShape(overlayRadius: 18.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),*/
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 230.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Wight',
                          style: labelTextStyle,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          weight.toString(),
                          style: lNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: labelTextStyle),
                        Text(age.toString(), style: lNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculator',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiCount: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                    bmiAdvice: calc.getAdvice(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// width: 170.0,
// height: 200.0,
//================
// cardChild: Column(
// children: [
// Icon(
// FontAwesomeIcons.mars,
// size: 80.0,
// ),
// SizedBox(
// height: 15.0,
// ),
// Text(
// 'Male',
// style: TextStyle(
// color: Color(0xFFEB1555),
// fontSize: 18.0,
// ),
// )
// ],
// ),
//==============================
// children: [
// Expanded(
// child: ReusableCard(
// colour: activeCardColor,
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: activeCardColor,
// ),
// ),
// ],
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: activeCardColor,
// ),
// ),
// Expanded(
// child: Row(
// children: [
// Expanded(
// child: ReusableCard(
// colour: activeCardColor,
// ),
// ),
// Expanded(
// child: ReusableCard(
// colour: activeCardColor,
// ),
// ),
// ],
