import 'package:flutter/material.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/submit_button.dart';
import '../home/main_home_page.dart';

class AepodsSync extends StatelessWidget {
  const AepodsSync({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C9359),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            left: Dimensions.screenSize(auto: 24),
            top: Dimensions.screenSize(h: 120),
            right: Dimensions.screenSize(auto: 24),
            bottom: Dimensions.screenSize(h: 56)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigText(
              text: "Let's set you up",
            ),
            SizedBox(height: Dimensions.screenSize(h: 16)),
            const CustomText(
              text: "Sync your Aepods with the app for added functionality",
              color: Colors.white,
              fontSize: 18,
            ),
            SizedBox(height: Dimensions.screenSize(h: 40)),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, position) {
                          return Container(
                            width: double.infinity,
                            height: Dimensions.screenSize(h: 85),
                            padding: EdgeInsets.fromLTRB(
                                Dimensions.screenSize(auto: 12),
                                Dimensions.screenSize(h: 20),
                                Dimensions.screenSize(auto: 16),
                                Dimensions.screenSize(h: 16)),
                            margin: EdgeInsets.only(
                                bottom: Dimensions.screenSize(h: 12)),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Upstairs Pod',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Proxima Nova',
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .75,
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Synced',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Proxima Nova Alt',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.screenSize(auto: 4),
                                          ),
                                          const Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: 'ID: 1344295024',
                                  color: Colors.white.withOpacity(.75),
                                )
                              ],
                            ),
                          );
                        }),
                    Container(
                      width: double.infinity,
                      height: Dimensions.screenSize(h: 56),
                      padding: EdgeInsets.only(
                        left: Dimensions.screenSize(auto: 12),
                        right: Dimensions.screenSize(auto: 8),
                      ),
                      margin: EdgeInsets.only(
                          bottom: Dimensions.screenSize(h: 12)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sync new Aepod',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Proxima Nova',
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            color: Colors.white.withOpacity(0.75),
                            icon: const Icon(Icons.add_circle,),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SubmitButton(
                text: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainHomePage()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
