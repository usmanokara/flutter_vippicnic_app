import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vippicnic/screens/login_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

class WelcomeScreen extends StatefulWidget {
  static String ID = "/welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CenterText(
                  text: "Welcome to ",
                  textColor: kPrimaryColor,
                  fontSize: 18,
                  isBold: true,
                  isCenter: true,
                  textStyle: TextStyle(fontFamily: 'open_bold'),
                ),
                CenterText(
                  text: "Vip Picnic",
                  textColor: kPrimaryColor.withOpacity(0.5),
                  fontSize: 28,
                  isCenter: true,
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/svg/welcome.svg",
              width: MediaQuery.of(context).size.width * 0.50,
            ),
            CenterText(
              text:
                  "Create your event\nAdd and invite Friends\nRegister your moments",
              textColor: kPrimaryColor.withOpacity(0.8),
              fontSize: 22,
              isCenter: true,
            ),
            Column(
              children: [
                SizedBox(height: 20),
                MaterialButton(
                  color: kPrimaryColor,
                  shape: CircleBorder(),
                  onPressed: () => Navigator.pushNamed(context, LoginScreen.ID),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.chevron_right,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
