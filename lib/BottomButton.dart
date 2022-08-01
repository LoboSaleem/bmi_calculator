import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle, style: lBottomButton),
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
