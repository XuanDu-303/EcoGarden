import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final int? maxLines;
  final TextAlign textAlign;
  const CustomText(
      {super.key,
      this.color = const Color(0xFF06492C),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.fontSize = 14,
      this.fontFamily = 'Proxima Nova Alt',
      this.fontWeight = FontWeight.w400,
      this.maxLines = 1,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
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
