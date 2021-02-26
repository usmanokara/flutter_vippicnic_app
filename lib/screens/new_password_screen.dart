import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import 'login_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  static String ID = "/new_password_screen";

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                    text: "New Password:",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    textStyle: GoogleFonts.openSans(),
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text: "Enter your new password",
                    textColor: kPrimaryColor.withOpacity(0.8),
                    fontSize: 18,
                    textStyle: GoogleFonts.openSans(),
                    isCenter: true,
                  ),
                  SizedBox(height: 20),
                  InputTyoe(
                    hint: "New Password",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 10),
                  InputTyoe(
                    hint: "Confirm Password",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 15),
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
                              text: "save password".toUpperCase(),
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
