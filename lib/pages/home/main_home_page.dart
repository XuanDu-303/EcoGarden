import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/utils/dimensions.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../../main.dart';
import '../../widgets/app_icon.dart';
import '../shared/app_ navigation_bar.dart';
import 'home_page_body.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late int selectIndex;

  @override
  Widget build(BuildContext context) {
    selectIndex = Provider.of<DataProvider>(context).selectIndex;
    return Scaffold(
      backgroundColor: const Color(0xFFF5FDFB),
      body: Column(
        children: <Widget>[
          // showing the header
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.screenSize(auto: 64),
                bottom: Dimensions.screenSize(auto: 32)),
            padding: EdgeInsets.only(
                left: Dimensions.screenSize(auto: 24),
                right: Dimensions.screenSize(auto: 24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Hello, Isaac ',
                      fontFamily: 'Noe Display',
                      fontSize: 32,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const CustomText(
                        text: '🌿',
                        fontFamily: 'Noe Display',
                        fontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                AppIcon(
                  icon: Icons.settings,
                  backgroundColor: const Color(0xFF0C9359).withOpacity(.05),
                  size: 26,
                  boxShadow: Colors.transparent,
                )
              ],
            ),
          ),

          // showing the body
          const Expanded(
              flex: 8,
              child:
                  SingleChildScrollView(child: HomePageBody())),

          // showing the fodder
          AppNavigationBar(
            selectedCategory: 'Home',
            selectIndex: selectIndex,
          )
        ],
      ),
    );
  }
}
