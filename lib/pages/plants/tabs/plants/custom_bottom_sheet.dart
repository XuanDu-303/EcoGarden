import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/plants.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/custom_text.dart';

class CustomBottomSheet extends StatefulWidget {
  final int selectedIndex;
  final List<Plant> plants;
  const CustomBottomSheet({
    super.key,
    required this.selectedIndex,
    required this.plants,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  CarouselController buttonCarouselController = CarouselController();
  late int currentIndex;
  late final List<Plant> plants;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
    plants = widget.plants;
  }

  @override
  Widget build(BuildContext context) {
    final Plant plant = plants[currentIndex];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: Dimensions.screenSize(auto: 16),
          bottom: Dimensions.screenSize(auto: 56)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.screenSize(auto: 32)),
          topRight: Radius.circular(Dimensions.screenSize(auto: 32)),
        ),
      ),
      child: Column(
        children: [
          Container(
              width: Dimensions.screenSize(auto: 48),
              height: Dimensions.screenSize(auto: 8),
              decoration: BoxDecoration(
                  color: const Color(0x3F06492C),
                  borderRadius:
                      BorderRadius.circular(Dimensions.screenSize(auto: 4)))),
          SizedBox(height: Dimensions.screenSize(auto: 40)),
          CarouselSlider(
            items: plants.map((data) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.screenSize(auto: 120),
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenSize(auto: 35.0),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: Dimensions.screenSize(auto: 120),
              aspectRatio: 16 / 9,
              viewportFraction: 0.45,
              initialPage: currentIndex,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              // scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: Dimensions.screenSize(auto: 17),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenSize(auto: 16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => buttonCarouselController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: SizedBox(
                    width: Dimensions.screenSize(auto: 40),
                    height: Dimensions.screenSize(auto: 40),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 27,
                        color: const Color(0xFF06492c).withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                CustomText(
                  text: plant.plantName,
                  color: const Color(0xFF111111),
                  fontSize: 32,
                  fontFamily: 'Noe Display',
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () => buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: SizedBox(
                    width: Dimensions.screenSize(auto: 40),
                    height: Dimensions.screenSize(auto: 40),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 27,
                        color: const Color(0xFF06492c).withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.screenSize(auto: 4)),
          CustomText(
            text: plant.plantType,
            color: const Color(0xBF06492C),
            fontSize: 21,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: Dimensions.screenSize(auto: 16)),
          CustomText(
            text: 'Harvest in ${plant.daysBetween(plant.harvestDate)}',
            fontSize: 16,
            fontFamily: 'Proxima Nova Alt',
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: Dimensions.screenSize(auto: 8)),
          CustomText(
            text: 'Planted ${plant.daysBetween(plant.plantDate)}',
            color: const Color(0x7F06492C),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: Dimensions.screenSize(auto: 24),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: Dimensions.screenSize(auto: 8)),
            height: Dimensions.screenSize(auto: 56),
            width: Dimensions.screenSize(auto: 243),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F0C9359),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/Frame2.svg',
                  fit: BoxFit.cover,
                  width: Dimensions.screenSize(auto: 24),
                  height: Dimensions.screenSize(auto: 24),
                ),
                CustomText(
                  text: '${plant.temperature}°c',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                SvgPicture.asset(
                  'assets/icons/Frame10.svg',
                  fit: BoxFit.cover,
                  width: Dimensions.screenSize(auto: 16),
                  height: Dimensions.screenSize(auto: 16),
                ),
                Container(
                  width: Dimensions.screenSize(auto: 1),
                  height: MediaQuery.of(context).size.height,
                  color: const Color(0x1906492C),
                ),
                SvgPicture.asset(
                  'assets/icons/Frame3.svg',
                  fit: BoxFit.cover,
                  width: Dimensions.screenSize(auto: 24),
                  height: Dimensions.screenSize(auto: 24),
                ),
                CustomText(
                  text: '${plant.moistureLevel}%',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                SvgPicture.asset(
                  'assets/icons/Frame10.svg',
                  fit: BoxFit.cover,
                  width: Dimensions.screenSize(auto: 16),
                  height: Dimensions.screenSize(auto: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.screenSize(auto: 28),
          ),
          InkWell(
            onTap: () {},
            child: const CustomText(
              text: 'See growing tips',
              color: Color(0xFF0C9359),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
