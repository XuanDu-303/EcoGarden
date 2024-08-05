import 'package:flutter/material.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../utils/dimensions.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const SocialButton({super.key, required this.icon, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: Dimensions.screenSize(auto: 56),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(Dimensions.screenSize(auto: 16)),
            color: Colors.transparent,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white.withOpacity(0.75),),
                SizedBox(width: Dimensions.screenSize(auto: 8)),
                CustomText(
                  text: text,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
