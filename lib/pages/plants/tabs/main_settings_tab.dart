import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/custom_text.dart';


class MainSettingsTab extends StatelessWidget {
  const MainSettingsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
        EdgeInsets.symmetric(horizontal: Dimensions.screenSize(auto: 16), vertical: Dimensions.screenSize(auto: 20)),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.screenSize(auto: 20)),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F0C9359),
                blurRadius: 24,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.signal_wifi_0_bar,
                      size: Dimensions.screenSize(auto: 24),
                      color: const Color(0xff3BCEAC).withOpacity(0.75),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 12),
                    ),
                    const CustomText(
                      text: 'Connectivity',
                      color: Color(0xFF06492C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'Connected via Wifi',
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 8),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 24),
                      height: Dimensions.screenSize(auto: 24),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: const Color(0xff0C9359),
                          size: Dimensions.screenSize(auto: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.screenSize(auto: 16)),
              width: double.infinity,
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/IconLight.svg',
                      fit: BoxFit.cover,
                      color: const Color(0xff3BCEAC).withOpacity(0.75),
                      width: Dimensions.screenSize(auto: 24),
                      height: Dimensions.screenSize(auto: 24),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 12),
                    ),
                    const CustomText(
                      text: 'Plantlight Settings',
                      color: Color(0xFF06492C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'Currently ON',
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 8),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 24),
                      height: Dimensions.screenSize(auto: 24),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: const Color(0xff0C9359),
                          size: Dimensions.screenSize(auto: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.screenSize(auto: 16)),
              width: double.infinity,
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Frame7.svg',
                      fit: BoxFit.cover,
                      color: const Color(0xff3BCEAC).withOpacity(0.75),
                      width: Dimensions.screenSize(auto: 24),
                      height: Dimensions.screenSize(auto: 24),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 12),
                    ),
                    const CustomText(
                      text: 'Cycle Settings',
                      color: Color(0xFF06492C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                SizedBox(
                  width: Dimensions.screenSize(auto: 24),
                  height: Dimensions.screenSize(auto: 24),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xff0C9359),
                      size: Dimensions.screenSize(auto: 17),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.screenSize(auto: 16)),
              width: double.infinity,
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/IconSync.svg',
                      fit: BoxFit.cover,
                      color: const Color(0xff3BCEAC).withOpacity(0.75),
                      width: Dimensions.screenSize(auto: 24),
                      height: Dimensions.screenSize(auto: 24),
                    ),
                    SizedBox(
                      width: Dimensions.screenSize(auto: 12),
                    ),
                    const CustomText(
                      text: 'Aepod Sync Settings',
                      color: Color(0xFF06492C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                SizedBox(
                  width: Dimensions.screenSize(auto: 24),
                  height: Dimensions.screenSize(auto: 24),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xff0C9359),
                      size: Dimensions.screenSize(auto: 17),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
