import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.iconReImage, required this.iconReText});

  final IconData iconReImage;
  final String iconReText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconReImage,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(iconReText, style: labelTextStyle),
      ],
    );
  }
}
