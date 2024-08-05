import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../models/gardens.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../plants/plants_detail_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  double _currPageValue = 0.0;
  dynamic dataProvider;
  int selectIndex = 0;
  int gardenCount = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
        selectIndex = _currPageValue.toInt();
        dataProvider.updateSelectIndex(selectIndex);
      });
    });
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        if (selectIndex < gardenCount - 1) {
          selectIndex++;
        } else {
          selectIndex = 0;
        }
        _pageController.animateToPage(
          selectIndex,
          duration: const Duration(milliseconds: 800),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Garden>>(
        stream: readGardens(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Center(child: CircularProgressIndicator());
          }
          List<Garden> gardens = snapshot.data!;
          Garden garden = gardens[selectIndex];
          gardenCount = gardens.length;
          return Column(
            children: [
              SizedBox(
                height: Dimensions.screenSize(auto: 249),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: gardens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildPageItem(gardens, index);
                  },
                ),
              ),
              // dots
              DotsIndicator(
                dotsCount: gardens.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: Colors.green,
                  size: Size.square(Dimensions.screenSize(auto: 8)),
                  activeSize: Size(Dimensions.screenSize(auto: 18),
                      Dimensions.screenSize(auto: 8)),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: Dimensions.screenSize(auto: 32),
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: Dimensions.screenSize(auto: 8.0),
                      spacing: Dimensions.screenSize(auto: 8.0),
                      children: [
                        SizedBox(
                          width: Dimensions.screenSize(w: 362),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runSpacing: Dimensions.screenSize(auto: 8.0),
                            spacing: Dimensions.screenSize(auto: 8.0),
                            children: [
                              IconAndTextWidget(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0) *
                                            2)) /
                                    Dimensions.screenSize(w: 3),
                                svgPath: 'assets/icons/Frame.svg',
                                text: 'Humidity',
                                text2: '${garden.humidity}%',
                              ),
                              IconAndTextWidget(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0) *
                                            2)) /
                                    Dimensions.screenSize(w: 3),
                                svgPath: 'assets/icons/Frame2.svg',
                                text: 'Temperature',
                                text2: '${garden.temperature}°c',
                              ),
                              IconAndTextWidget(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0) *
                                            2)) /
                                    Dimensions.screenSize(w: 3),
                                svgPath: 'assets/icons/Frame3.svg',
                                text: 'Water Level',
                                text2: '${garden.waterLevel}%',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenSize(w: 362),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runSpacing: Dimensions.screenSize(auto: 8.0),
                            spacing: Dimensions.screenSize(auto: 8.0),
                            children: [
                              IconAndTextWidget(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0))) /
                                    Dimensions.screenSize(w: 3),
                                svgPath: 'assets/icons/Frame4.svg',
                                text: 'Connectivity',
                                text2: 'Online',
                              ),
                              IconAndTextWidget2(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0))) /
                                    Dimensions.screenSize(w: 3 / 2),
                                svgPath: 'assets/icons/Frame5.svg',
                                svgPath2: 'assets/icons/Frame6.svg',
                                text: 'Nutrient Level',
                                text2: '5 grams left',
                                text3: 'Refill in 2 days',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.screenSize(w: 362),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runSpacing: Dimensions.screenSize(auto: 8.0),
                            spacing: Dimensions.screenSize(auto: 8.0),
                            children: [
                              IconAndTextWidget2(
                                width: (Dimensions.screenSize(w: 360) -
                                        (Dimensions.screenSize(auto: 8.0))) /
                                    Dimensions.screenSize(w: 3 / 2),
                                svgPath: 'assets/icons/Frame7.svg',
                                svgPath2: 'assets/icons/Frame8.svg',
                                text: 'Status',
                                text2: '6 plants growing',
                                text3: 'Next harvest in 3 days',
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            Dimensions.screenSize(auto: 32)),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return const Wrap(
                                        children: [
                                          CustomBottomSheet(),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: IconAndTextWidget(
                                  width: (Dimensions.screenSize(w: 360) -
                                          (Dimensions.screenSize(auto: 8.0))) /
                                      Dimensions.screenSize(w: 3),
                                  svgPath: 'assets/icons/Frame9.svg',
                                  text: 'Light Status',
                                  text2: 'On',
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildPageItem(List<Garden> gardens, int index) {
    dataProvider = Provider.of<DataProvider>(context, listen: false);
    Garden garden = gardens[index];

    return Stack(
      children: [
        Container(
          height: Dimensions.screenSize(auto: 200),
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.screenSize(auto: 6)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(garden.imageUrl))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 200),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: PlantsDetailPage(
                            selectIndex: selectIndex,
                            updateData: (String newData) {},
                            tempData: 'Home',
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                    height: Dimensions.screenSize(auto: 85),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenSize(auto: 16)),
                    margin: EdgeInsets.only(
                        left: Dimensions.screenSize(auto: 31),
                        right: Dimensions.screenSize(auto: 31),
                        bottom: Dimensions.screenSize(auto: 20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFe8e8e8),
                              spreadRadius: 0,
                              blurRadius: 10.0,
                              offset: Offset(0, 5)),
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              text: garden.gardenName,
                              color: const Color(0xFF111111),
                              fontSize: 21,
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w600,
                            ),
                            Opacity(
                                opacity: 0.50,
                                child: CustomText(
                                    text: 'ID: ${garden.id}',
                                    color: const Color(0xFF111111),
                                    fontFamily: 'Proxima Nova'))
                          ],
                        ),
                        Container(
                          width: Dimensions.screenSize(auto: 32),
                          height: Dimensions.screenSize(auto: 32),
                          decoration: BoxDecoration(
                            color: const Color(0xFFf3faf7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: Dimensions.screenSize(auto: 17),
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stream<List<Garden>> readGardens() => FirebaseFirestore.instance
      .collection('gardens')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Garden.fromJson(doc.data(), id: doc.id,)).toList());

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.screenSize(auto: 28),
          right: Dimensions.screenSize(auto: 28),
          top: Dimensions.screenSize(auto: 16),
          bottom: Dimensions.screenSize(auto: 64)),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Container(
              width: Dimensions.screenSize(auto: 48),
              height: Dimensions.screenSize(auto: 8),
              decoration: BoxDecoration(
                  color: const Color(0x3F06492C),
                  borderRadius: BorderRadius.circular(4))),
          SizedBox(height: Dimensions.screenSize(auto: 40)),
          const CustomText(
            text: 'Light Status',
            color: Color(0xFF111111),
            fontSize: 21,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w600,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.screenSize(auto: 32),
                  bottom: Dimensions.screenSize(auto: 24)),
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Lights',
                fontSize: 21,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
              ),
              FlutterSwitch(
                width: Dimensions.screenSize(auto: 68),
                height: Dimensions.screenSize(auto: 32),
                valueFontSize: Dimensions.screenSize(auto: 16),
                toggleSize: Dimensions.screenSize(auto: 24),
                activeColor: const Color(0xFF0C9359),
                value: status,
                borderRadius: Dimensions.screenSize(auto: 32),
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: Dimensions.screenSize(auto: 24)),
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Automatic Settings',
                fontSize: 21,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: Dimensions.screenSize(auto: 101),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: 'Off at Sunset'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: Dimensions.screenSize(auto: 15),
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.screenSize(auto: 24),
                  bottom: Dimensions.screenSize(auto: 32)),
              height: Dimensions.screenSize(auto: 1),
              color: const Color(0x1906492C)),
          const CustomText(
            text: 'Go to Settings',
            fontSize: 21,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
