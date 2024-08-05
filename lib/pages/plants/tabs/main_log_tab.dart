import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/custom_text.dart';

class MainLogTab extends StatelessWidget {
  const MainLogTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.screenSize(auto: 16)),
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.screenSize(auto: 20)),
          width: double.infinity,
          height: Dimensions.screenSize(auto: 60),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Sort by:',
                color: Color(0xBF06492C),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              Row(
                children: [
                  const CustomText(
                    text: 'Urgency: High to Low',
                    color: Color(0xFF0C9359),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: Dimensions.screenSize(auto: 8),
                  ),
                  const AppIcon(
                    icon: Icons.keyboard_arrow_down,
                    size: 24,
                    widthSize: 32,
                    heightSize: 32,
                    backgroundColor: Color(0xFFf3faf7),
                    boxShadow: Colors.transparent,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.screenSize(auto: 16),
              left: Dimensions.screenSize(auto: 20),
              right: Dimensions.screenSize(auto: 20),
              bottom: Dimensions.screenSize(auto: 16)),
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenSize(auto: 8),
              vertical: Dimensions.screenSize(auto: 10)),
          width: double.infinity,
          // height: Dimensions.screenSize(auto: 380),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x1906492C), // Màu viền
                    width: 1, // Độ dày của viền
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.screenSize(auto: 16)),
                      width: double.infinity,
                      height: Dimensions.screenSize(auto: 52),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0C9359),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber,
                                size: Dimensions.screenSize(auto: 20),
                                color: const Color(0xffFFFFFF).withOpacity(0.5),
                              ),
                              SizedBox(
                                width: Dimensions.screenSize(auto: 8),
                              ),
                              const CustomText(
                                text: 'Water Refill Due',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const CustomText(
                            text: '5hr ago',
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.screenSize(auto: 16.0)),
                      child: const CustomText(
                        text:
                            'This Aepod’s water level is low (10%), you should refill it.',
                        color: Color(0xFF111111),
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: Dimensions.screenSize(auto: 1),
                        color: const Color(0x1906492C)),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.screenSize(auto: 16.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Refill Now',
                            color: Color(0xFF0C9359),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          AppIcon(
                            icon: Icons.arrow_forward_ios,
                            widthSize: 32,
                            heightSize: 32,
                            size: 17,
                            backgroundColor:
                                const Color(0xFF0C9359).withOpacity(0.05),
                            boxShadow: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.screenSize(auto: 16),
              ),
              Container(
                  padding: EdgeInsets.all(Dimensions.screenSize(auto: 16)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0x1906492C), // Màu viền
                      width: 1, // Độ dày của viền
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                size: Dimensions.screenSize(auto: 20),
                                color: const Color(0xff06492c).withOpacity(0.5),
                              ),
                              SizedBox(
                                width: Dimensions.screenSize(auto: 8),
                              ),
                              const CustomText(
                                text: 'New cycle started',
                                color: Color(0xFF06492C),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                          const CustomText(
                            text: '5m',
                            color: Color(0xBF111111),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.screenSize(auto: 19),
                      ),
                      const CustomText(
                        text:
                            'You just started a new cycle, time to grow new plants 😊',
                        color: Color(0xFF111111),
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      )
                    ],
                  )),
              SizedBox(
                height: Dimensions.screenSize(auto: 24),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenSize(auto: 16)),
                width: double.infinity,
                height: Dimensions.screenSize(auto: 58),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x1906492C), // Màu viền
                    width: 1, // Độ dày của viền
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Frame7.svg',
                          fit: BoxFit.cover,
                          color: const Color(0xff06492C).withOpacity(.5),
                          width: Dimensions.screenSize(auto: 20),
                          height: Dimensions.screenSize(auto: 20),
                        ),
                        SizedBox(
                          width: Dimensions.screenSize(auto: 8),
                        ),
                        const CustomText(
                          text: 'Oregano ready for harvest',
                          color: Color(0xFF06492C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                    const CustomText(
                      text: '2 days ago',
                      color: Color(0xBF111111),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.screenSize(auto: 16),),

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenSize(auto: 16)),
                width: double.infinity,
                height: Dimensions.screenSize(auto: 58),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x1906492C), // Màu viền
                    width: 1, // Độ dày của viền
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Frame7.svg',
                          fit: BoxFit.cover,
                          color: const Color(0xff06492C).withOpacity(.5),
                          width: Dimensions.screenSize(auto: 20),
                          height: Dimensions.screenSize(auto: 20),
                        ),
                        SizedBox(
                          width: Dimensions.screenSize(auto: 8),
                        ),
                        const CustomText(
                          text: 'Oregano ready for harvest',
                          color: Color(0xFF06492C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                    const CustomText(
                      text: '2 days ago',
                      color: Color(0xBF111111),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
