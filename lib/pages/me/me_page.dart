import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/create_garden.dart';
import 'package:untitled2/pages/welcome/login.dart';
import 'package:untitled2/utils/dimensions.dart';
import 'package:untitled2/widgets/app_icon.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../../main.dart';
import '../add_plants_page.dart';
import '../shared/app_ navigation_bar.dart';
import '../store/plants_store_page.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectIndex = Provider.of<DataProvider>(context).selectIndex;

    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        backgroundColor: const Color(0xFFF5FDFB),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset('assets/images/circle4.svg',
                          width: Dimensions.screenSize(w: 240),
                          height: Dimensions.screenSize(h: 240))),
                  Positioned(
                      top: 0,
                      left: Dimensions.screenSize(w: 30),
                      child: SvgPicture.asset('assets/images/circle5.svg',
                          width: Dimensions.screenSize(w: 640),
                          height: Dimensions.screenSize(h: 320))),
                  Positioned(
                      top: Dimensions.screenSize(h: 138),
                      left: 0,
                      child: SvgPicture.asset('assets/images/circle6.svg',
                          width: Dimensions.screenSize(w: 240),
                          height: Dimensions.screenSize(h: 240))),
                  Positioned(
                      top: Dimensions.screenSize(h: 220),
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.screenSize(w: 20)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          // text: 'Hello ${user.email!}',
                                          text: 'Hello, Issast',
                                          fontFamily: 'Noe Display',
                                          fontSize: 32,
                                          color: Color(0xFF111111),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomText(
                                          text: '🌿',
                                          fontFamily: 'Noe Display',
                                          fontSize: 32,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    AppIcon(
                                      icon: FontAwesomeIcons.pen,
                                      backgroundColor: const Color(0xFF0C9359)
                                          .withOpacity(.05),
                                      boxShadow: Colors.transparent,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.screenSize(h: 28),
                                      bottom: Dimensions.screenSize(h: 24)),
                                  padding: EdgeInsets.only(
                                    top: Dimensions.screenSize(h: 20),
                                    bottom: Dimensions.screenSize(h: 12),
                                  ),
                                  width: double.infinity,
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
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PlantsStorePage()),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.screenSize(
                                                  w: 14)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .local_grocery_store_outlined,
                                                    color:
                                                        const Color(0xFF3BCEAC)
                                                            .withOpacity(.75),
                                                    size: Dimensions.screenSize(
                                                        w: 24),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.screenSize(
                                                            w: 12),
                                                  ),
                                                  const CustomText(
                                                    text:
                                                        'Visit the Aepod Store',
                                                    fontFamily: 'Proxima Nova',
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              AppIcon(
                                                icon: Icons.arrow_forward_ios,
                                                widthSize: 32,
                                                heightSize: 32,
                                                size: 17,
                                                backgroundColor:
                                                    const Color(0xFF0C9359)
                                                        .withOpacity(0.05),
                                                boxShadow: Colors.transparent,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: Dimensions.screenSize(h: 16),
                                              bottom:
                                                  Dimensions.screenSize(h: 8),
                                              left: Dimensions.screenSize(
                                                  w: 8),
                                              right: Dimensions.screenSize(
                                                  w: 8)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.screenSize(
                                                w: 14)),
                                        child: const CustomText(
                                          text:
                                              'Buy attachments and supplements for your Aepod. Orders typically arrive in 3 working days',
                                          color: Color(0xFF111111),
                                          maxLines: null,
                                          overflow: TextOverflow.visible,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.screenSize(w: 16),
                                        vertical: Dimensions.screenSize(h: 20)),
                                    // margin: EdgeInsets.symmetric(
                                    //     horizontal: Dimensions.screenSize(w: 20)),
                                    width: double.infinity,
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
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.signal_wifi_0_bar,
                                                  size: Dimensions.screenSize(
                                                      h: 24),
                                                  color: const Color(0xff3BCEAC)
                                                      .withOpacity(0.75),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 12),
                                                ),
                                                const CustomText(
                                                  text: 'Language',
                                                  color: Color(0xFF06492C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const CustomText(
                                                  text: 'English',
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 8),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 24),
                                                  height: Dimensions.screenSize(
                                                      h: 24),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: const Color(
                                                          0xff0C9359),
                                                      size:
                                                          Dimensions.screenSize(
                                                              w: 17),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  Dimensions.screenSize(h: 16)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/IconLight.svg',
                                                  fit: BoxFit.cover,
                                                  // ignore: deprecated_member_use
                                                  color: const Color(0xff3BCEAC)
                                                      .withOpacity(0.75),
                                                  width: Dimensions.screenSize(
                                                      w: 24),
                                                  height: Dimensions.screenSize(
                                                      h: 24),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 12),
                                                ),
                                                const CustomText(
                                                  text: 'Currency',
                                                  color: Color(0xFF06492C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const CustomText(
                                                  text: 'USD',
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 8),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 24),
                                                  height: Dimensions.screenSize(
                                                      h: 24),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: const Color(
                                                          0xff0C9359),
                                                      size:
                                                          Dimensions.screenSize(
                                                              w: 17),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  Dimensions.screenSize(h: 16)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C),
                                        ),
                                        InkWell(
                                          onTap:() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const CreateGardenPage()),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/Frame6.svg',
                                                    fit: BoxFit.cover,
                                                    // ignore: deprecated_member_use
                                                    color: const Color(0xff3BCEAC)
                                                        .withOpacity(0.75),
                                                    width: Dimensions.screenSize(
                                                        w: 24),
                                                    height: Dimensions.screenSize(
                                                        h: 24),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.screenSize(
                                                        w: 12),
                                                  ),
                                                  const CustomText(
                                                    text: 'Create garden',
                                                    color: Color(0xFF06492C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: Dimensions.screenSize(
                                                        w: 24),
                                                    height: Dimensions.screenSize(
                                                        h: 24),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: const Color(
                                                            0xff0C9359),
                                                        size:
                                                        Dimensions.screenSize(
                                                            w: 17),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                              Dimensions.screenSize(h: 16)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C),
                                        ),
                                        InkWell(
                                          onTap:() {

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const AddPlantPage(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/Frame6.svg',
                                                    fit: BoxFit.cover,
                                                    // ignore: deprecated_member_use
                                                    color: const Color(0xff3BCEAC)
                                                        .withOpacity(0.75),
                                                    width: Dimensions.screenSize(
                                                        w: 24),
                                                    height: Dimensions.screenSize(
                                                        h: 24),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.screenSize(
                                                        w: 12),
                                                  ),
                                                  const CustomText(
                                                    text: 'Create plant',
                                                    color: Color(0xFF06492C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: Dimensions.screenSize(
                                                        w: 24),
                                                    height: Dimensions.screenSize(
                                                        h: 24),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: const Color(
                                                            0xff0C9359),
                                                        size:
                                                        Dimensions.screenSize(
                                                            w: 17),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  Dimensions.screenSize(h: 16)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/IconSync.svg',
                                                  fit: BoxFit.cover,
                                                  color: const Color(0xff3BCEAC)
                                                      .withOpacity(0.75),
                                                  width: Dimensions.screenSize(
                                                      w: 24),
                                                  height: Dimensions.screenSize(
                                                      h: 24),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.screenSize(
                                                      w: 12),
                                                ),
                                                const CustomText(
                                                  text: 'Sync Settings',
                                                  color: Color(0xFF06492C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: Dimensions.screenSize(
                                                  w: 24),
                                              height:
                                                  Dimensions.screenSize(h: 24),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color:
                                                      const Color(0xff0C9359),
                                                  size: Dimensions.screenSize(
                                                      w: 17),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  Dimensions.screenSize(h: 16)),
                                          width: double.infinity,
                                          height: Dimensions.screenSize(h: 1),
                                          color: const Color(0x1906492C),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            FirebaseAuth.instance
                                                .signOut()
                                                .then((value) {
                                              print('Signed Out');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Login()),
                                              );
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.logout_outlined,
                                                    size: Dimensions.screenSize(
                                                        h: 24),
                                                    color:
                                                        const Color(0xff3BCEAC)
                                                            .withOpacity(0.75),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.screenSize(
                                                            w: 12),
                                                  ),
                                                  const CustomText(
                                                    text: 'Logout',
                                                    color: Color(0xFF06492C),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: Dimensions.screenSize(
                                                    w: 24),
                                                height: Dimensions.screenSize(
                                                    h: 24),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color:
                                                        const Color(0xff0C9359),
                                                    size: Dimensions.screenSize(
                                                        w: 17),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            AppNavigationBar(selectedCategory: 'Me', selectIndex: selectIndex)
          ],
        ));
  }
}
