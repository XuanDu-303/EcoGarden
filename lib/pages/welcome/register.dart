// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/pages/Welcome/login.dart';
import 'package:untitled2/pages/auth_service.dart';
import 'package:untitled2/widgets/custom_text.dart';
import 'package:untitled2/widgets/submit_button.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_input_widget.dart';
import 'call_name.dart';
import '../../widgets/social_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void registerUser() async {
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
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CallName()),
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        showErrorMessage("Password is too weak"); 
      } else if (e.code == 'email-already-in-use') {
        showErrorMessage("Email is already in use");
      } else if (!isEmailValid(email)) {
        showErrorMessage("Invalid email format");
      } else {
        showErrorMessage("Registration failed: ${e.message}");
      }
    } catch (e) {
      print(e.toString());
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
            Dimensions.screenSize(auto: 24),
            Dimensions.screenSize(h: 120),
            Dimensions.screenSize(auto: 24),
            Dimensions.screenSize(h: 64)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BigText(
                  text: 'Register on Aepod',
                ),
                SizedBox(height: Dimensions.screenSize(h: 16)),
                const CustomText(
                  text: 'Create an Aepod account, We can’t wait to have you.',
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
            Column(children: [
              SubmitButton(
                text: 'Register',
                onTap: () {
                  registerUser();
                },
              ),
              SizedBox(height: Dimensions.screenSize(h: 32)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const CustomText(
                  text: 'Already have an account? Login',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
