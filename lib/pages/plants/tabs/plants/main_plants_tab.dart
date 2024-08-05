import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/utils/dimensions.dart';

import '../../../../models/plants.dart';
import '../../../../widgets/custom_text.dart';
import 'custom_bottom_sheet.dart';

class MainPlantsTab extends StatefulWidget {
  final String selectGardenId;
  const MainPlantsTab({super.key, required this.selectGardenId});

  @override
  State<MainPlantsTab> createState() => _MainPlantsTabState();
}

class _MainPlantsTabState extends State<MainPlantsTab> {
  static int selectedIndex = -1;
  late final String gardenId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gardenId = widget.selectGardenId;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Plant>>(
        stream: readPlants(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Something went wrong!',
                textAlign: TextAlign.center);
          } else if (snapshot.hasData) {
            List<Plant> plants = snapshot.data!;
            final int count = plants
                .where((plant) => plant.daysBetween(plant.plantDate) > 15)
                .length;
            late Plant harvestPlant = plants.reduce((plant, next) =>
                plant.daysBetween(plant.harvestDate) <
                        plant.daysBetween(next.harvestDate)
                    ? plant
                    : next);
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.screenSize(auto: 20),
                    right: Dimensions.screenSize(auto: 20),
                    bottom: Dimensions.screenSize(auto: 16),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenSize(auto: 12),
                      vertical: Dimensions.screenSize(auto: 16)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          Dimensions.screenSize(auto: 12)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1F0C9359),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        )
                      ]),
                  child: plants.isEmpty == true
                      ? SizedBox(
                          height: Dimensions.screenSize(auto: 438),
                          child: const Center(
                              child: CustomText(
                            text: 'Empty garden',
                          )))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Frame7.svg',
                                  fit: BoxFit.cover,
                                  width: Dimensions.screenSize(auto: 24),
                                  height: Dimensions.screenSize(auto: 24),
                                ),
                                Flexible(
                                    child: CustomText(
                                  text:
                                      ' Using $count out ${plants.length} pods',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.screenSize(auto: 12),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Frame8.svg',
                                  fit: BoxFit.cover,
                                  width: Dimensions.screenSize(auto: 24),
                                  height: Dimensions.screenSize(auto: 24),
                                ),
                                SizedBox(
                                  width: Dimensions.screenSize(auto: 310),
                                  child: CustomText(
                                    text:
                                        ' ${harvestPlant.plantName} will be ready for harvest in ${harvestPlant.daysBetween(harvestPlant.harvestDate)} days',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ),
                plants.isEmpty == true
                    ? const SizedBox()
                    : Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.screenSize(auto: 20),
                            right: Dimensions.screenSize(auto: 20),
                            bottom: Dimensions.screenSize(auto: 16)),
                        padding: EdgeInsets.all(Dimensions.screenSize(auto: 8)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                Dimensions.screenSize(auto: 12)),
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
                              padding: EdgeInsets.all(
                                  Dimensions.screenSize(auto: 12)),
                              width: double.infinity,
                              height: Dimensions.screenSize(auto: 40),
                              decoration: BoxDecoration(
                                  color: const Color(0x0C0C9359),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(
                                          Dimensions.screenSize(auto: 4)),
                                      bottom: Radius.circular(
                                          Dimensions.screenSize(auto: 2)))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Frame6.svg',
                                    fit: BoxFit.cover,
                                    width: Dimensions.screenSize(auto: 16),
                                    height: Dimensions.screenSize(auto: 16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.screenSize(auto: 8),
                                  ),
                                  CustomText(
                                    text: 'Growing now',
                                    fontSize: Dimensions.screenSize(auto: 14),
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: plants.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildPlant(context, index, plants);
                              },
                            )
                          ],
                        ),
                      ),
              ],
            );
          } else {
            return Container(
                height: Dimensions.screenSize(auto: 500),
                color: const Color(0xFFF5FDFB),
                child: const Center(child: CircularProgressIndicator()));
          }
        });
  }

  Widget buildPlant(context, int index, List<Plant> plants) {
    Plant plant = plants[index];
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Dimensions.screenSize(auto: 32)),
                ),
              ),
              builder: (BuildContext context) {
                return Wrap(children: [
                  CustomBottomSheet(
                      selectedIndex: selectedIndex, plants: plants),
                ]);
              },
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: Dimensions.screenSize(auto: 4)),
            width: double.infinity,
            height: Dimensions.screenSize(auto: 69),
            child: Row(
              children: [
                Container(
                  width: Dimensions.screenSize(auto: 56),
                  height: Dimensions.screenSize(auto: 56),
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(plant.imageUrl))),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenSize(auto: 12),
                        vertical: Dimensions.screenSize(auto: 8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: plant.plantName,
                                  fontSize: 21,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: Dimensions.screenSize(auto: 4),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/Frame10.svg',
                                  fit: BoxFit.cover,
                                  width: Dimensions.screenSize(auto: 20),
                                  height: Dimensions.screenSize(auto: 20),
                                ),
                              ],
                            ),
                            CustomText(
                              text: plant.plantType,
                              fontSize: 14,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text:
                                  'Harvest in ${plant.daysBetween(plant.harvestDate)}',
                              fontSize: 14,
                            ),
                            SizedBox(
                              height: Dimensions.screenSize(auto: 5),
                            ),
                            CustomText(
                              text:
                                  'Planted ${plant.daysBetween(plant.plantDate)}',
                              fontSize: 14,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        plants.length - 1 == index
            ? const SizedBox()
            : Container(
                width: double.infinity,
                height: Dimensions.screenSize(auto: 1),
                decoration: const BoxDecoration(color: Color(0x1906492C)),
              )
      ],
    );
  }

  Stream<List<Plant>> readPlants() => FirebaseFirestore.instance
      .collection('gardens')
      .doc(gardenId)
      .collection('plants')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Plant.fromJson(doc.data(), id: doc.id)).toList());
}
