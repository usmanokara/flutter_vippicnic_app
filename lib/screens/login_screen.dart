import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/forgot_password_Screen.dart';
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
      body: Stack(
        children: [
          Image.asset(
            "assets/images/login_back.png",
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.grey.withOpacity(0.4),
                    Colors.white.withOpacity(0.6),
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SafeArea(
              child: Container(
                alignment: Alignment.bottomCenter,
                //Set container alignment  then wrap the column with singleChildScrollView
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InputTyoe(
                        hint: "Username",
                        onTextChange: (text) {},
                      ),
                      SizedBox(height: 10),
                      InputTyoe(
                        hint: "Password",
                        onTextChange: (text) {},
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: kSecondryColor,
                        onPressed: () {},
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          child: Stack(
                            children: [
                              Center(
                                child: CenterText(
                                  text: "login".toUpperCase(),
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          OutlineButton(
                            onPressed: () {
                              setState(() {
                                _keepMeLogedIn = !_keepMeLogedIn;
                              });
                            },
                            shape: CircleBorder(),
                            borderSide: BorderSide(
                              color: kPrimaryColor.withOpacity(0.5),
                              //Color of the border
                              style: BorderStyle.solid,
                              //Style of the border
                              width: 1, //width of the border
                            ),
                            padding: EdgeInsets.all(0),
                            child: _keepMeLogedIn
                                ? Icon(
                                    Icons.check,
                                    color: kPrimaryColor,
                                    size: 25,
                                  )
                                : Container(
                                    width: 25,
                                    height: 25,
                                    child: SizedBox(),
                                  ),
                          ),
                          CenterText(
                              text: "Keep me logged in ",
                              textColor: kPrimaryColor,
                              fontSize: 16),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, ForgotPasswordScreen.ID),
                            child: CenterText(
                                fontWeight: FontWeight.w700,
                                text: "Forgot?",
                                textColor: kSecondryColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        borderSide: BorderSide(
                          color: kPrimaryColor, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: 1, //width of the border
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, CreateAccountScreen.ID),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          child: Stack(
                            children: [
                              Center(
                                child: CenterText(
                                    text: "Create account".toUpperCase(),
                                    textColor: kPrimaryColor,
                                    fontSize: 20),
                              ),
                              Positioned(
                                  right: 5,
                                  top: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
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
                      SizedBox(height: 20)
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
  InputTyoe({this.hint, this.textInputType, this.onTextChange});

  String hint;
  Function(String text) onTextChange;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    textInputType = textInputType ?? TextInputType.text;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          textAlign: TextAlign.center,
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
