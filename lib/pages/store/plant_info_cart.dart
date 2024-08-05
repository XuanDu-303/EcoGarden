// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/widgets/big_text.dart';
import 'package:untitled2/widgets/custom_text.dart';
import '../../models/plants.dart';
import '../../utils/dimensions.dart';
import '../../widgets/submit_button.dart';

class PlantInfoCart extends StatefulWidget {
  final Plant treeDetail;
  final List<Plant> allPlants;

  const PlantInfoCart({
    super.key,
    required this.treeDetail,
    required this.allPlants,
  });

  @override
  State<PlantInfoCart> createState() => _PlantInfoCartState();
}

class _PlantInfoCartState extends State<PlantInfoCart> {
  late Plant currentTree;
  late List<Plant> allPlants;
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
  int count = 0;

  @override
  void initState() {
    super.initState();
    currentTree = widget.treeDetail;
    allPlants = widget.allPlants;
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isVisible = _scrollController.offset <= 80;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Plant> plantTypeCounts = allPlants
        .where((plant) => plant.plantType == currentTree.plantType)
        .toList();
    List<Plant> plantsListType =
        plantTypeCounts.where((plant) => plant.id != currentTree.id).toList();

    print(currentTree.id);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                SizedBox(height: Dimensions.screenSize(auto: 80)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenSize(auto: 24)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.screenSize(auto: 42),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.screenSize(auto: 14)),
                              width: Dimensions.screenSize(auto: 234),
                              height: Dimensions.screenSize(auto: 102),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    text: currentTree.plantName,
                                    color: const Color(0xFF111111),
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: currentTree.plantType,
                                        color: const Color(0xBF06492C),
                                        fontSize: 21,
                                        fontFamily: 'Proxima Nova',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.screenSize(auto: 8)),
                                        width: Dimensions.screenSize(auto: 4),
                                        height: Dimensions.screenSize(auto: 4),
                                        color: const Color(0xFF0C9359),
                                      ),
                                      CustomText(
                                        text: '\$${currentTree.price}',
                                        color: const Color(0xBF06492C),
                                        fontSize: 21,
                                        fontFamily: 'Proxima Nova',
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text:
                                            '${plantTypeCounts.length} people are growing this ',
                                        color: const Color(0xBF111111),
                                      ),
                                      const CustomText(
                                        text: '🌿',
                                        color: Colors.green,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: Dimensions.screenSize(auto: 120),
                              height: Dimensions.screenSize(auto: 120),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(currentTree.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 28),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.screenSize(auto: 20), vertical: Dimensions.screenSize(auto: 14)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: Dimensions.screenSize(auto: 2),
                                      color: const Color(0xFF0C9359)),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.screenSize(auto: 4)),
                                ),
                                child: const Center(
                                    child: Icon(
                                  FontAwesomeIcons.heart,
                                  color: Color(0xFF0C9359),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.screenSize(auto: 12),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: SubmitButton(
                                    text: 'Add to Cart',
                                    textColor: Colors.white,
                                    backgroundColor: const Color(0xFF0C9359),
                                    boxShadowColor: const Color(0x1F0C9359),
                                    onTap: () {}),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 32),
                        ),
                        const CustomText(
                          text: 'Description',
                          color: Color(0x7F06492C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 16),
                        ),
                        CustomText(
                            text: currentTree.description,
                            color: const Color(0xFF111111),
                            maxLines: null,
                            overflow: TextOverflow.visible),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 24),
                        ),
                        SizedBox(
                            height: Dimensions.screenSize(auto: 138),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Growing information',
                                  color: Color(0x7F06492C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Frame2.svg',
                                      color: const Color(0xFF3BCEAC)
                                          .withOpacity(.75),
                                      width: Dimensions.screenSize(auto: 24),
                                      height: Dimensions.screenSize(auto: 24),
                                    ),
                                    SizedBox(
                                      width: Dimensions.screenSize(auto: 12),
                                    ),
                                    const CustomText(
                                      text: 'Room temparature is fine',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Frame3.svg',
                                      color: const Color(0xFF3BCEAC)
                                          .withOpacity(.75),
                                      width: Dimensions.screenSize(auto: 24),
                                      height: Dimensions.screenSize(auto: 24),
                                    ),
                                    SizedBox(
                                      width: Dimensions.screenSize(auto: 12),
                                    ),
                                    const CustomText(
                                      text: 'Regular watering works best',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Frame7.svg',
                                      color: const Color(0xFF3BCEAC)
                                          .withOpacity(.75),
                                      width: Dimensions.screenSize(auto: 24),
                                      height: Dimensions.screenSize(auto: 24),
                                    ),
                                    SizedBox(
                                      width: Dimensions.screenSize(auto: 12),
                                    ),
                                    const CustomText(
                                      text:
                                          'Typically ready for harvest after 4 weeks',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 32),
                        ),
                        CustomText(
                          text: 'Other ${currentTree.plantType}',
                          color: const Color(0x7F06492C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ]),
                ),
                buildCategory(plantsListType: plantsListType),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isVisible ? 1.0 : 0.0,
              curve: Curves.easeInOut,
              child: Visibility(
                visible: _isVisible,
                maintainSize: false,
                maintainState: false,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(top: Dimensions.screenSize(auto: 64)),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).popUntil((route) {
                          return count++ == 2;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/IconDown.svg',
                        color: const Color(0xFF06492C).withOpacity(.25),
                        width: Dimensions.screenSize(auto: 64),
                        height: Dimensions.screenSize(auto: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory({double marginT = 24, required List<Plant> plantsListType}) {
    return Container(
      height: Dimensions.screenSize(auto: 290),
      margin: EdgeInsets.only(
          top: Dimensions.screenSize(h: Dimensions.screenSize(h: marginT))),
      child: plantsListType.isEmpty == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plantsListType.length,
              itemBuilder: (context, position) {
                Plant plant = plantsListType[position];
                return _buildPageItem(plant, position);
              }),
    );
  }

  Widget _buildPageItem(Plant plant, int position) {
    return InkWell(
      onTap: () {
        setState(() {
          currentTree = plant;
        });
      },
      child: Container(
        width: Dimensions.screenSize(auto: 177),
        height: Dimensions.screenSize(auto: 250),
        margin: EdgeInsets.only(
            left: Dimensions.screenSize(auto: position == 0 ? 24 : 6),
            right: Dimensions.screenSize(auto: 6),
            top: Dimensions.screenSize(h: 16),
            bottom: Dimensions.screenSize(h: 24)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(Dimensions.screenSize(auto: 12)),
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
              height: Dimensions.screenSize(auto: 177),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.screenSize(auto: 12)),
                    topRight: Radius.circular(Dimensions.screenSize(auto: 12)),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(plant.imageUrl))),
            ),
            SizedBox(
              height: Dimensions.screenSize(auto: 16),
            ),
            BigText(
                text: plant.plantName,
                color: const Color(0xFF06492C),
                fontSize: 21,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600),
            CustomText(
              text: '\$${plant.price}',
              color: const Color(0xBF06492C),
            )
          ],
        ),
      ),
    );
  }
}
