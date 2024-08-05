import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/pages/plants/tabs/main_log_tab.dart';
import 'package:untitled2/pages/plants/tabs/main_settings_tab.dart';
import 'package:untitled2/pages/plants/tabs/plants/main_plants_tab.dart';
import '../../models/gardens.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/custom_text.dart';

class PlantsDetailPage extends StatefulWidget {
  final Function(String) updateData;
  final String tempData;
  final int? selectIndex;
  const PlantsDetailPage(
      {Key? key, required this.selectIndex, required this.updateData, required this.tempData, })
      : super(key: key);

  @override
  State<PlantsDetailPage> createState() => _PlantsDetailPageState();
}

class _PlantsDetailPageState extends State<PlantsDetailPage> {
  String selectedCategory = 'PLANTS';
  late final int selectIndex;
  late final int index;
  late Garden garden;

  @override
  void initState() {
    super.initState();
    selectIndex = widget.selectIndex!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDFB),
        body: StreamBuilder<List<Garden>>(
      stream: readGardens(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        garden = snapshot.data![selectIndex];
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: Dimensions.screenSize(auto: 245),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(garden.imageUrl)
                      )
                  ),
                ),
                Positioned(
                  top: Dimensions.screenSize(auto: 64),
                  left: Dimensions.screenSize(auto: 24),
                  right: Dimensions.screenSize(auto: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context, widget.updateData(widget.tempData));
                          },
                          child: const AppIcon(
                            icon: FontAwesomeIcons.angleLeft,
                            text: 'Go Back',widthSize: 121,
                          )),
                      InkWell(
                          onTap: () {},
                          child: const AppIcon(icon: Icons.more_horiz_sharp,), ),
                    ],
                  ),
                ),
              ]),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: Dimensions.screenSize(auto: 20),
                          horizontal: Dimensions.screenSize(auto: 20)),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: garden.gardenName,
                            color: const Color(0xFF111111),
                            fontSize: 32,
                            fontFamily: 'Noe Display',
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: Dimensions.screenSize(auto: 4),),
                          Opacity(
                              opacity: 0.50,
                              child: CustomText(
                                  text: 'ID: ${garden.id}',
                                  color: const Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Proxima Nova'))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.screenSize(auto: 20),
                        right: Dimensions.screenSize(auto: 20),
                        bottom: Dimensions.screenSize(auto: 24),
                      ),
                      padding: EdgeInsets.all(Dimensions.screenSize(auto: 4)),
                      height: Dimensions.screenSize(auto: 50),
                      decoration: BoxDecoration(
                        color: const Color(0x0C06492C),
                        borderRadius:
                            BorderRadius.circular(Dimensions.screenSize(auto: 12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildCategoryButton('PLANTS'),
                          buildCategoryButton('LOG'),
                          buildCategoryButton('SETTINGS'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildContent(selectedCategory),
            ],
          ),
        );
      },
    ));
  }

  Widget buildCategoryButton(String category) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCategory = category;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: category == selectedCategory ? Colors.white : null,
            borderRadius: BorderRadius.circular(Dimensions.screenSize(auto: 12)),
            boxShadow: category == selectedCategory
                ? [
                    const BoxShadow(
                      color: Color(0x1F0C9359),
                      blurRadius: 24,
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: CustomText(
              text: category,
              color: category == selectedCategory
                  ? const Color(0xFF06492C)
                  : const Color(0x7F0C9359),
              fontSize: 16,
              fontFamily: 'Proxima Nova Alt',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Stream<List<Garden>> readGardens() => FirebaseFirestore.instance
      .collection('gardens')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Garden.fromJson(doc.data(), id: doc.id,)).toList());

  Widget buildContent(String category) {
    switch (category) {
      case 'PLANTS':
        return MainPlantsTab(selectGardenId: garden.id);
      case 'LOG':
        return const MainLogTab();
      case 'SETTINGS':
        return const MainSettingsTab();
      default:
        return Container();
    }
  }
}
