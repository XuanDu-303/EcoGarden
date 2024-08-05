import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/cart_page.dart';
import 'package:untitled2/pages/store/bottom_sheet_store.dart';
import 'package:untitled2/utils/dimensions.dart';
import 'package:untitled2/widgets/app_icon.dart';
import 'package:untitled2/widgets/big_text.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../../models/plants.dart';

class PlantsStorePage extends StatefulWidget {
  const PlantsStorePage({super.key});

  @override
  State<PlantsStorePage> createState() => _PlantsStorePageState();
}

class _PlantsStorePageState extends State<PlantsStorePage> {
  String selectedCategory = 'All';
  List<Plant> plantsWithSelectedType2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDFB),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Plant>>(
          stream: readPlants(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.hasData) {
              List<Plant> plants = snapshot.data!;
              List<String> distinctPlantTypes =
                  plants.map((plant) => plant.plantType).toSet().toList();
              distinctPlantTypes.insert(0, 'All');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.screenSize(auto: 24),
                        right: Dimensions.screenSize(auto: 24),
                        top: Dimensions.screenSize(auto: 64),
                        bottom: Dimensions.screenSize(auto: 40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const AppIcon(
                              icon: Icons.arrow_back_ios,
                              text: 'Go back',
                              widthSize: 121,
                              heightSize: 40,
                              fontSize: 18,
                              size: 16),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const CartPage()),
                            );
                          },
                          child: AppIcon(
                            icon: Icons.local_grocery_store,
                            size: Dimensions.screenSize(auto: 16),
                            widthSize: 40,
                            heightSize: 40,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: Dimensions.screenSize(auto: 24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BigText(
                          text: 'Shop 🛒',
                          color: Color(0xFF111111),
                          fontSize: 32,
                        ),
                        SizedBox(
                          height: Dimensions.screenSize(auto: 32),
                        ),
                        const BigText(
                            text: 'Popular items',
                            color: Color(0xFF111111),
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  buildCategory(plants: plants, marginT: 16, marginB: 48, allPlants: plants, height: 314),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.screenSize(auto: 24),
                        bottom: Dimensions.screenSize(auto: 16)),
                    child: const BigText(
                      text: 'Our nursery',
                      color: Color(0xFF111111),
                      fontSize: 21,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.screenSize(auto: 42),
                    child: distinctPlantTypes.isEmpty == true
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: distinctPlantTypes.length,
                            itemBuilder: (context, position) {
                              return buildCategoryButton(
                                  distinctPlantTypes, position, plants);
                            }),
                  ),
                  buildCategory(
                      plants: selectedCategory == 'All'
                          ? plants
                          : plantsWithSelectedType2,
                      allPlants: plants)
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildPageItem(Plant plant, int position, List<Plant> allPlants, marginT, marginB) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimensions.screenSize(auto: 32)),
            ),
          ),
          builder: (BuildContext context) {
            return Wrap(
              children: [
                BottomSheetStore(treeDetail: plant, allPlants: allPlants),
              ],
            );
          },
        );
      },
      child: Container(
        width: Dimensions.screenSize(auto: 177),
        height: Dimensions.screenSize(auto: 250),
        margin: EdgeInsets.only(
            left: Dimensions.screenSize(auto: position == 0 ? 24 : 6),
            right: Dimensions.screenSize(auto: 6),
            top: Dimensions.screenSize(auto: marginT),
            bottom: Dimensions.screenSize(auto: marginB)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(Dimensions.screenSize(auto: 12)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F0C9359),
                blurRadius: 20,
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
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: '\$${plant.price}',
              color: const Color(0xBF06492C),
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(List<String> distinctPlantTypes, int index, List<Plant> plants) {
    String selectedPlantType = distinctPlantTypes[index];
    List<Plant> plantsWithSelectedType = plants
        .where((plant) => plant.plantType == selectedPlantType)
        .toList();
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = selectedPlantType;
          plantsWithSelectedType2 = plantsWithSelectedType;
        });
      },
      child: Container(
        height: Dimensions.screenSize(auto: 42),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.screenSize(auto: 16),
        ),
        margin: EdgeInsets.only(
            left: Dimensions.screenSize(auto: index == 0 ? 24 : 6),
            right: Dimensions.screenSize(auto: 6)),
        decoration: BoxDecoration(
          color: selectedCategory == selectedPlantType
              ? const Color(0xFF3BCEAC)
              : Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.screenSize(auto: 30)),
        ),
        child: Center(
          child: CustomText(
            text: distinctPlantTypes[index],
            color: selectedCategory == selectedPlantType
                ? Colors.white
                : const Color(0xFF3BCEAC),
            fontSize: Dimensions.screenSize(auto: 16),
            fontFamily: 'Proxima Nova Alt',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget buildCategory(
      {double marginT = 32, marginB = 20, height = 316, required List<Plant> plants, required List<Plant> allPlants}) {
    return SizedBox(
      height: Dimensions.screenSize(auto: height),
      child: plants.isEmpty == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plants.length,
              itemBuilder: (context, position) {
                Plant plant = plants[position];
                return _buildPageItem(plant, position, allPlants, marginT, marginB);
              }),
    );
  }

  Stream<List<Plant>> readPlants() => FirebaseFirestore.instance
      .collectionGroup('plants').snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Plant.fromJson(doc.data(), id: doc.id)).toList());

}
