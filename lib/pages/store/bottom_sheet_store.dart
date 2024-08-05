import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/pages/store/plant_info_cart.dart';
import 'package:untitled2/widgets/submit_button.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/custom_text.dart';
import '../../models/plants.dart';
import '../../widgets/big_text.dart';

class BottomSheetStore extends StatefulWidget {
  final Plant treeDetail;
  final List<Plant> allPlants;
  const BottomSheetStore({
    super.key,
    required this.treeDetail,
    required this.allPlants,
  });

  @override
  State<BottomSheetStore> createState() => _BottomSheetStoreState();
}

class _BottomSheetStoreState extends State<BottomSheetStore> {
  late Plant currentTree;
  late List<Plant> allPlants;
  @override
  void initState() {
    super.initState();
    currentTree = widget.treeDetail;
    allPlants = widget.allPlants;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.screenSize(auto: 24),
          right: Dimensions.screenSize(auto: 24),
          top: Dimensions.screenSize(auto: 16),
          bottom: Dimensions.screenSize(auto: 56)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.screenSize(auto: 32)),
          topRight: Radius.circular(Dimensions.screenSize(auto: 32)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: Dimensions.screenSize(auto: 48),
              height: Dimensions.screenSize(auto: 8),
              decoration: BoxDecoration(
                  color: const Color(0x3F06492C),
                  borderRadius:
                      BorderRadius.circular(Dimensions.screenSize(auto: 4)))),
          SizedBox(height: Dimensions.screenSize(auto: 40)),
          Container(
            width: Dimensions.screenSize(auto: 120),
            height: Dimensions.screenSize(auto: 120),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentTree.imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: Dimensions.screenSize(auto: 16)),
          BigText(
            text: currentTree.plantName,
            color: const Color(0xFF111111),
          ),
          SizedBox(height: Dimensions.screenSize(auto: 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    horizontal: Dimensions.screenSize(auto: 8)),
                width: Dimensions.screenSize(auto: 4),
                height: Dimensions.screenSize(auto: 4),
                decoration: const ShapeDecoration(
                  color: Color(0xBF06492C),
                  shape: OvalBorder(),
                ),
              ),
              CustomText(
                text: '\$${currentTree.price}',
                color: const Color(0xFF0C9359),
                fontSize: 21,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: Dimensions.screenSize(auto: 24)),
          SizedBox(
              width: Dimensions.screenSize(auto: 350),
              child: CustomText(
                text: currentTree.description,
                maxLines: 2,
                color: const Color(0xBF111111),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: Dimensions.screenSize(auto: 24)),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.screenSize(auto: 32)),
                  ),
                ),
                builder: (BuildContext context) {
                  return PlantInfoCart(
                      treeDetail: currentTree, allPlants: allPlants);
                },
              );
            },
            child: const CustomText(
              text: 'Read more',
              color: Color(0xFF0C9359),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: Dimensions.screenSize(auto: 32)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenSize(auto: 20),
                      vertical: Dimensions.screenSize(auto: 14)),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: Dimensions.screenSize(auto: 2),
                        color: const Color(0xFF0C9359)),
                    borderRadius:
                        BorderRadius.circular(Dimensions.screenSize(auto: 4)),
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
          )
        ],
      ),
    );
  }
}
