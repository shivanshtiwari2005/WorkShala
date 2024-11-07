import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontStyle? fontStyle;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontfamily;

  const CustomText({super.key, 
    required this.text,
    required this.fontStyle,
    required this.color,
    this.fontSize,
    this.textAlign,
    this.fontfamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontFamily: ,
        fontFamily: fontfamily,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 10,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
