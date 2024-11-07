import 'package:flutter/material.dart';
import 'package:intershipapp/widgets/Customtext.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = Colors.grey,
    this.textColor = Colors.black,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: CustomText(
        text: buttonText,
        fontStyle: null,
        color: textColor,
        fontSize: fontSize,
      ),
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
      ),
    );
  }
}
