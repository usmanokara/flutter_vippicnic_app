import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippicnic/screens/new_password_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String ID = "forgot_password";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      "assets/svg/password.svg",
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: MediaQuery.of(context).size.width * 0.30,
                    ),
                  ),
                  SizedBox(height: 10),
                  CenterText(
                    text: "Forgot Password?",
                    textColor: kPrimaryColor,
                    fontSize: 24,
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text:
                        "Enter your email and we will\nsend you instructions on how\nto reset your password",
                    textColor: kPrimaryColor.withOpacity(0.8),
                    fontSize: 18,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  InputTyoe(
                    hint: "email@gmail.com",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, NewPasswordScreen.ID),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "RESET PASSWORD".toUpperCase(),
                              textColor: Colors.white,
                              fontSize: 20,
                              isBold: true,
                            ),
                          ),
                          Positioned(
                              right: 5,
                              top: 0,
                              bottom: 0,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
