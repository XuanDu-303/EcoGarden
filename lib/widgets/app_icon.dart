import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/widgets/custom_text.dart';
import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData? icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double fontSize;
  final String? text;
  final double widthSize;
  final double heightSize;
  final Color boxShadow;
  const AppIcon({
    super.key,
    this.size = 16,
    required this.icon,
    this.text,
    this.backgroundColor = Colors.white,
    this.iconColor = const Color(0xFF0C9359),
    this.widthSize = 40,
    this.heightSize = 40,
    this.boxShadow = const Color(0x1F0C9359), this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.screenSize(auto: widthSize),
        height: Dimensions.screenSize(auto: heightSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((Dimensions.screenSize(auto: 40)) / 2),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: boxShadow,
              spreadRadius: 5,
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: iconColor,
              size: Dimensions.screenSize(auto: size)
            ),
            if (text != null)
              CustomText(
                text: ' $text',
                color: const Color(0xFF0C9359),
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              )
          ],
        ));
  }
}
