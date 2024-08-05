import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/pages/Welcome/register.dart';
import 'package:untitled2/widgets/big_text.dart';
import 'package:untitled2/widgets/custom_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/submit_button.dart';
import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C9359),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.screenSize(h: -192),
              child: SvgPicture.asset("./assets/images/circle.svg",
              fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Color(0x00000fff), BlendMode.srcIn), width: Dimensions.screenSize(auto: 640),height: Dimensions.screenSize(auto: 640)),
            ),
            Positioned(
              top: Dimensions.screenSize(h: 192),
              left: 0,
              child: SvgPicture.asset("./assets/images/circle2.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0x00000fff), BlendMode.srcIn), width: Dimensions.screenSize(auto: 640), height: Dimensions.screenSize(auto: 640),),
            ),
            Positioned(
              top: Dimensions.screenSize(h: 440),
              left: Dimensions.screenSize(auto: 35),
              child: Transform.rotate(
                angle: -90 * (3.1415926535897932 / 180),
                child: SvgPicture.asset(
              fit: BoxFit.cover,
                  "./assets/images/circle2.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0x00000fff), BlendMode.srcIn),width: Dimensions.screenSize(auto: 640), height: Dimensions.screenSize(auto: 640)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenSize(h: 64),
                  left: Dimensions.screenSize(auto: 24),
                  right: Dimensions.screenSize(auto: 24),
                  bottom: Dimensions.screenSize(h: 56)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "./assets/icons/logo.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0x00000fff), BlendMode.srcIn),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigText(
                        text: 'Welcome to Aepod',
                      ),
                      SizedBox(height: Dimensions.screenSize(h: 16)),
                      const CustomText(
                        text:
                            'Grow plants easily from your home with our award-winning pods',
                        color: Colors.white,
                        fontSize: 18,
                        overflow: TextOverflow.visible,
                        maxLines: null,
                      ),
                      SizedBox(height: Dimensions.screenSize(h: 104)),
                      SubmitButton(
                        text: 'Register',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                      ),
                      SizedBox(height: Dimensions.screenSize(h: 24)),
                      SubmitButton(
                        border: Border.all(width: 2, color: Colors.white),
                        text: 'Login',
                        backgroundColor: Colors.transparent,
                        textColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
