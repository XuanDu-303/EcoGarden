// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:untitled2/pages/Welcome/register.dart';
import 'package:untitled2/pages/home/main_home_page.dart';
import 'package:untitled2/widgets/custom_text.dart';
import 'package:untitled2/widgets/submit_button.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_input_widget.dart';
import '../../widgets/social_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void signUserIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainHomePage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (email.isEmpty || password.isEmpty) {
        showErrorMessage("Please enter email and password");
      } else if (!isEmailValid(email)) {
        showErrorMessage("Invalid email format");
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showErrorMessage("Invalid email or password");
      } else {
        showErrorMessage("Login failed: ${e.message}");
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(color: Colors.redAccent),
          )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C9359),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            Dimensions.screenSize(auto: 24),
            Dimensions.screenSize(h: 120),
            Dimensions.screenSize(auto: 24),
            Dimensions.screenSize(h: 64)),
        // child: SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BigText(
                  text: 'Welcome back',
                ),
                SizedBox(height: Dimensions.screenSize(h: 16)),
                const CustomText(
                  text:
                      'Let’s get back to growing your Aepod plants, shall we?',
                  fontSize: 18,
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.screenSize(h: 48)),
                IconAndInputWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  hinText: 'Email Address',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: Dimensions.screenSize(h: 32)),
                IconAndInputWidget(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  icon: Icons.lock_outlined,
                  hinText: 'Password',
                  isPasswordType: true,
                ),
                SizedBox(height: Dimensions.screenSize(h: 16)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainHomePage()),
                    );
                  },
                  child: const CustomText(
                    text: 'Forgot your password?',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: Dimensions.screenSize(h: 48)),
                const CustomText(
                  text: 'Or Register using social media',
                  fontSize: 18,
                  color: Colors.white,
                ),
                SizedBox(height: Dimensions.screenSize(h: 24)),
                Row(
                  children: [
                    SocialButton(
                      onTap: () {},
                      icon: FontAwesomeIcons.squareFacebook,
                      text: 'Facebook',
                    ),
                    SizedBox(width: Dimensions.screenSize(auto: 16)),
                    SocialButton(
                      onTap: () {},
                      icon: FontAwesomeIcons.google,
                      text: 'Google',
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SubmitButton(
                  text: 'Login',
                  onTap: () {
                    signUserIn();
                  },
                ),
                SizedBox(height: Dimensions.screenSize(h: 32)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: const CustomText(
                    text: 'New here? Register',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
