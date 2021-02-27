import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/forgot_password_Screen.dart';
import 'package:vippicnic/screens/home_screens/home_bottom_sheet.dart';
import 'package:vippicnic/screens/login_with_email_screen.dart';
import 'package:vippicnic/screens/signup/create_account_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

class LoginScreen extends StatefulWidget {
  static String ID = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keepMeLogedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/hd_back.png",
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SafeArea(
              child: Container(
                alignment: Alignment.bottomCenter,
                //Set container alignment  then wrap the column with singleChildScrollView
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.white,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Continue with Google',
                              style: GoogleFonts.openSans(
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 15),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.white,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Continue with Facebook',
                              style: GoogleFonts.openSans(
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 15),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: kSecondryColor,
                        onPressed: () => Navigator.pushNamed(
                            context, LoginWithEmailScreen.ID),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          child: Stack(
                            children: [
                              Center(
                                child: CenterText(
                                  text: "Login with email",
                                  textColor: Colors.white,
                                  fontSize: 18,
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
                      SizedBox(height: 50),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "By tapping Log In, you agree with our\n",
                            style: GoogleFonts.openSans(
                              fontSize: 16.0,
                              color: kPrimaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: "Terms of services",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Privacy policy',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InputTyoe extends StatelessWidget {
  InputTyoe({this.hint, this.textInputType, this.onTextChange, this.textAlign});

  String hint;
  Function(String text) onTextChange;
  TextInputType textInputType;
  TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    textInputType = textInputType ?? TextInputType.text;
    textAlign = textAlign ?? TextAlign.center;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          textAlign: textAlign,
          keyboardType: textInputType,
          onChanged: onTextChange,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              labelStyle: GoogleFonts.openSans(fontWeight: FontWeight.w500),
              hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w500)),
        ),
      ),
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(color: Color(0xFFC4C4C4), width: 2)),
    );
  }
}
