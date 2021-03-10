import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippicnic/screens/home_screens/home_bottom_sheet.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../login_screen.dart';

class CreateAccountPassword extends StatefulWidget {
  static String ID = "/create_account_password";

  @override
  _CreateAccountPasswordState createState() => _CreateAccountPasswordState();
}

class _CreateAccountPasswordState extends State<CreateAccountPassword> {
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
                    text: "Create Password:",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    textStyle: TextStyle(
                      fontFamily: 'open_regular',),
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text: "Enter your new password",
                    textColor: kPrimaryColor.withOpacity(0.8),
                    fontSize: 18,
                    textStyle: TextStyle(
                      fontFamily: 'open_regular',),
                    isCenter: true,
                  ),
                  SizedBox(height: 20),
                  InputTyoe(
                    textAlign: TextAlign.center,
                    hint: "New Password",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 10),
                  InputTyoe(
                    textAlign: TextAlign.center,
                    hint: "Confirm Password",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 15),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () =>Navigator.pushNamed(context, HomeBottomNavigation.ID),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "finish".toUpperCase(),
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
