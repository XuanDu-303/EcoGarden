import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final String svgPath;
  final String text;
  final String text2;
  final double width;
  const IconAndTextWidget(
      {super.key, required this.svgPath, required this.text, required this.text2, this.width = 114,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenSize(auto: 114),
      width: Dimensions.screenSize(w: width),
      constraints: BoxConstraints(minWidth: Dimensions.screenSize(auto: 112)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFf2f2f2),
                spreadRadius: 5,
                blurRadius: 10.0,
                offset: Offset(0, 5)),
          ]),
      padding: EdgeInsets.only(top: Dimensions.screenSize(auto: 16), left: Dimensions.screenSize(auto: 12), bottom: Dimensions.screenSize(auto: 12),right: Dimensions.screenSize(auto: 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            svgPath,
            color: const Color(0xFF3BCEAC),
            fit: BoxFit.cover,
            width: Dimensions.screenSize(auto: 24),
            height: Dimensions.screenSize(auto: 24),
          ),
          CustomText(text: text),
          CustomText(text: text2, fontSize: 16, fontWeight: FontWeight.w700,),
        ],
      ),
    );
  }
}



class IconAndTextWidget2 extends StatelessWidget {
  final String text;
  final String svgPath;
  final String text2;
  final String svgPath2;
  final String text3;
  final double width;
  const IconAndTextWidget2(
      {super.key, required this.svgPath, required this.text, required this.text2, required this.svgPath2, required this.text3, this.width = 236,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenSize(auto: 114),
      width: Dimensions.screenSize(w: width),
      constraints: BoxConstraints(minWidth: Dimensions.screenSize(auto: 112)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFf2f2f2),
                spreadRadius: 5,
                blurRadius: 10.0,
                offset: Offset(0, 5)),
          ]),
      padding: EdgeInsets.only(top: Dimensions.screenSize(auto: 16), left: Dimensions.screenSize(auto: 12), bottom: Dimensions.screenSize(auto: 12),right: Dimensions.screenSize(auto: 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomText(text: text),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.cover,
                  width: Dimensions.screenSize(auto: 24),
                  height: Dimensions.screenSize(auto: 24),
                ),
                Flexible(child: CustomText(text: ' $text2', fontSize: 16,fontWeight: FontWeight.w700,)),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                svgPath2,
                // ignore: deprecated_member_use
                color: const Color(0xFF3BCEAC),
                fit: BoxFit.cover,
                width: Dimensions.screenSize(auto: 24),
                height: Dimensions.screenSize(auto: 24),
              ),
              Flexible(child: CustomText(text: ' $text3', fontSize: 16,fontWeight: FontWeight.w700,)),
            ],
          ),
        ],
      ),
    );
  }
}