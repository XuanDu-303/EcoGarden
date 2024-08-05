import 'package:flutter/material.dart';
import 'package:untitled2/pages/home/main_home_page.dart';
import 'package:untitled2/utils/dimensions.dart';
import 'package:untitled2/widgets/submit_button.dart';

import '../../widgets/big_text.dart';
import '../../widgets/icon_and_input_widget.dart';

class CallName extends StatelessWidget {
  CallName({super.key});

  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C9359),
      body: Padding(
          padding: EdgeInsets.fromLTRB(
              Dimensions.screenSize(auto: 24),
              Dimensions.screenSize(h: 120),
              Dimensions.screenSize(auto: 24),
              Dimensions.screenSize(h: 56)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: 'Let’s personalize your experience', maxLines: 2,),
                  SizedBox(height: Dimensions.screenSize(h: 16)),
                  const Text(
                    'What can we call you? Could be your name, a nickname or something funny ☺.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: Dimensions.screenSize(h: 48)),
                  IconAndInputWidget(
                    controller: _usernameController,
                    hinText: 'Name',
                    icon: Icons.person_outline,
                  )
                ],
              ),
              SubmitButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainHomePage()),
                    );
                  })
            ],
          )),
    );
  }
}
