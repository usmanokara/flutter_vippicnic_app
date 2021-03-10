import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippicnic/screens/home_screens/package/purchase_package_screen.dart';
import 'package:vippicnic/screens/home_screens/profile/edit_profile_screen.dart';
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Opacity(
                        opacity: 0,
                        child: Icon(Icons.arrow_back,
                            color: kPrimaryColor.withOpacity(0.1), size: 40)),
                    Expanded(
                      child: CenterText(
                        text: "Settings",
                        textColor: kPrimaryColor,
                        fontSize: 20,
                        isCenter: true,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Center(
                        child:
                            Icon(Icons.logout, color: kPrimaryColor, size: 30)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SettingsItem(
                    text: "Profile",
                    images: "user",
                    onClick: () =>
                        Navigator.pushNamed(context, EditProfileScreen.ID),
                  ),
                  SettingsItem(
                    text: "Privacy",
                    images: "privacy",
                    onClick: () {},
                  ),
                  SettingsItem(
                    text: "Idiom",
                    images: "idioms",
                    onClick: () {},
                  ),
                  SettingsItem(
                    text: "Support",
                    images: "support",
                    onClick: () {},
                  ),
                  SettingsItem(
                    text: "About Us",
                    images: "info",
                    onClick: () {},
                  ),
                  SettingsItem(
                    text: "Invite",
                    images: "invite",
                    onClick: () {},
                  ),
                  SettingsItem(
                    text: "Purchase package",
                    images: "purchase_package",
                    onClick: () =>
                        Navigator.pushNamed(context, PurchasePackageScreen.ID),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem({this.text, this.images, this.onClick});

  String text;
  String images;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: GestureDetector(
        onTap: this.onClick,
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/svg/$images.svg",
              color: Color(0xFF7d8187),
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: CenterText(
                  text: text,
                  textColor: kPrimaryColor.withOpacity(0.5),
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
