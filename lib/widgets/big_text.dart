import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final int? maxLines;
  const BigText(
      {super.key,
      this.color = Colors.white,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.fontSize = 32,
      this.fontFamily = 'Noe Display',
      this.fontWeight = FontWeight.w500,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        overflow: overflow,
        fontSize: Dimensions.screenSize(auto: fontSize),
        fontWeight: fontWeight,
      ),
    );
  }
}
