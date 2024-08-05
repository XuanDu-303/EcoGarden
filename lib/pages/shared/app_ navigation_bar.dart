import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:untitled2/pages/plants/plants_detail_page.dart';

import '../../utils/dimensions.dart';
import '../../widgets/custom_text.dart';
import '../home/main_home_page.dart';
import '../me/me_page.dart';

class AppNavigationBar extends StatefulWidget {
  final int? selectIndex;
  final String selectedCategory;
  const AppNavigationBar(
      {super.key, this.selectIndex, required this.selectedCategory});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  String? selectedCategory = 'Home';
  String tempData = '';

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
    setState(() {
      tempData = selectedCategory!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: Dimensions.screenSize(h: 70),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, -5))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCategoryButton(
                    'Home',
                    'assets/icons/logob.svg',
                  ),
                  buildCategoryButton('Plants', 'assets/icons/IconList.svg'),
                  buildCategoryButton('Me', 'assets/icons/IconMe.svg'),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category, String svgPath) {
    return InkWell(
      onTap: () {
        navigateToCategory(context, category);
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        height: Dimensions.screenSize(h: 44),
        width: Dimensions.screenSize(w: 112),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey[50],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              color: category == selectedCategory
                  ? const Color(0xFF0C9359)
                  : const Color(0xff111111).withOpacity(0.35),
              width: Dimensions.screenSize(w: 24),
              height: Dimensions.screenSize(h: 24),
            ),
            if (category == selectedCategory)
              Row(
                children: [
                  SizedBox(width: Dimensions.screenSize(w: 8)),
                  CustomText(
                    text: category,
                    color: const Color(0xFF0C9359),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }

  void navigateToCategory(BuildContext context, String category) {
    if (category == 'Home') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainHomePage(),
        ),
      );
    } else if (category == 'Plants') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlantsDetailPage(
                  selectIndex: widget.selectIndex,
                  updateData: (String newData) {
                    setState(() {
                      selectedCategory = newData;
                    });
                  }, tempData: tempData,
                )),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MePage()),
      );
    }
  }
}
