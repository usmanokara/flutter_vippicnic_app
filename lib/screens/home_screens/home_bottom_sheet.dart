import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vippicnic/screens/home_screens/AlertListScreen.dart';
import 'package:vippicnic/screens/home_screens/ChatListScreen.dart';
import 'package:vippicnic/screens/home_screens/SettingScreen.dart';
import 'package:vippicnic/screens/home_screens/home_screen.dart';
import 'package:vippicnic/screens/home_screens/new_post_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

class HomeBottomNavigation extends StatefulWidget {
  static String ID = "home_bottom_sheet";

  @override
  _HomeBottomNavigationState createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ChatListScreen(),
    AlertListScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: screens[selectedIndex]),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                border: Border.all(
                    color: kPrimaryColor.withOpacity(0.35), width: 1)),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                BottomItem(
                  isSelected: selectedIndex == 0,
                  icon: "home",
                  text: "Home",
                  onClick: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                BottomItem(
                  isSelected: selectedIndex == 1,
                  icon: "message",
                  text: "Chat",
                  onClick: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, NewPostScreen.ID),
                  child: Icon(
                    Icons.add_circle,
                    size: 55,
                    color: kSecondryColor,
                  ),
                ),
                BottomItem(
                  isSelected: selectedIndex == 2,
                  icon: "alert",
                  text: "Alerts",
                  onClick: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
                BottomItem(
                  isSelected: selectedIndex == 3,
                  icon: "settings",
                  text: "Setting",
                  onClick: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  BottomItem({this.icon, this.text, this.isSelected, this.onClick});

  String text;
  String icon;
  bool isSelected;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
              width: 40,
            ),
            SvgPicture.asset(
              "assets/svg/$icon.svg",
              width: 25,
              height: 25,
              color:
                  isSelected ? kPrimaryColor : kPrimaryColor.withOpacity(0.5),
            ),
            SizedBox(height: 5),
            CenterText(
              text: text,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor:
                  isSelected ? kPrimaryColor : kPrimaryColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
