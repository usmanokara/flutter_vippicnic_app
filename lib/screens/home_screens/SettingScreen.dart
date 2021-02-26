import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: kPrimaryColor, size: 40),
                    Expanded(
                      child: CenterText(
                        text: "Settings",
                        textColor: kPrimaryColor,
                        fontSize: 25,
                        isCenter: true,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Center(
                        child:
                            Icon(Icons.logout, color: kPrimaryColor, size: 40)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SettingsItem(
            text: "Profile",
            images: "user",
          ),
          SettingsItem(
            text: "Privacy",
            images: "privacy",
          ),
          SettingsItem(
            text: "Idiom",
            images: "idioms",
          ),
          SettingsItem(
            text: "Support",
            images: "support",
          ),
          SettingsItem(
            text: "About Us",
            images: "info",
          ),
          SettingsItem(
            text: "Invite",
            images: "invite",
          )
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem({this.text, this.images});

  String text;
  String images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Row(
        children: [
          SvgPicture.asset("assets/svg/$images.svg"),
          SizedBox(width: 10),
          CenterText(
              text: text, textColor: kPrimaryColor.withOpacity(0.5), fontSize: 20)
        ],
      ),
    );
  }
}
