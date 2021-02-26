import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/signup/verify_code_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../login_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  static String ID = "/verify_email_screen";

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
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
                  CenterText(
                    text: "Verify Your E-mail",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    textStyle: GoogleFonts.openSans(),
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text:
                        "Please enter your E-mail Address\nto receive the verify Code",
                    textColor: kPrimaryColor.withOpacity(0.9),
                    fontSize: 18,
                    textStyle: GoogleFonts.openSans(),
                    isCenter: true,
                  ),
                  SizedBox(height: 30),
                  InputTyoe(
                    hint: "Email:",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, VerifyCodeScreen.ID),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "continue".toUpperCase(),
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
