import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/search_friend_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class FriendProfileScreen extends StatefulWidget {
  static String ID = "friend_profile_screen";

  @override
  _FriendProfileScreenState createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  List<String> imagesLIst = [
    "https://www.incimages.com/uploaded_files/image/1920x1080/getty_614867390_321301.jpg",
    "https://images.pexels.com/photos/3171837/pexels-photo-3171837.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/shutterstock_199419065.jpg",
    "https://media.istockphoto.com/photos/nicelooking-attractive-gorgeous-glamorous-elegant-stylish-cheerful-picture-id1165055006?k=6&m=1165055006&s=612x612&w=0&h=X_d75QPcjQ0Zx-X2tTD4npQOIjD6lKXdDPqxJHuovhc=",
    "https://cdn.wallpapersafari.com/31/87/1MTHAb.jpg",
    "https://static.toiimg.com/photo/67228025.cms",
    "https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/shutterstock_199419065.jpg",
    "https://cdn.wallpapersafari.com/31/87/1MTHAb.jpg",
    "https://static.toiimg.com/photo/67228025.cms",
    "https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/shutterstock_199419065.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:
                        Icon(Icons.arrow_back, color: kPrimaryColor, size: 40)),
                Expanded(
                  child: CenterText(
                    text: "Profile",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    isCenter: true,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kSecondryColor),
                      child: Center(
                          child:
                              Icon(Icons.search, color: Colors.white, size: 30))),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                UserCircleAvatar(
                  url:
                      "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
                  size: 120,
                ),
                SizedBox(height: 10),
                CenterText(
                  text: "User name",
                  textColor: kPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
                CenterText(
                  text: "@Username",
                  textColor: kPrimaryColor,
                  fontSize: 17,
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileItem(
                      title: "Events",
                      value: "20",
                    ),
                    profileItemSeparator(),
                    profileItem(
                      title: "Following",
                      value: "59",
                    ),
                    profileItemSeparator(),
                    profileItem(
                      title: "Followers",
                      value: "9",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 135,
                      child: OutLineCustomButton(
                        text: "Follow",
                        click: () {},
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 135,
                      child: OutLineCustomButton(
                        text: "Message",
                        click: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CenterText(
                                        text: "Bio:",
                                        textColor: kPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                CenterText(
                                  maxLines: 2,
                                  text:
                                      "Musician since 2018, available to new events. Love plant and planet 🌱",
                                  textColor: kPrimaryColor.withOpacity(0.7),
                                  fontSize: 18,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  children: imagesLIst.map((e) {
                    return AppCacheImage(
                        imageUrl: e,
                        width: MediaQuery.of(context).size.width * 0.323,
                        height: MediaQuery.of(context).size.width * 0.323);
                  }).toList(),
                )
              ],
            ),
          )),
        ],
      ),
    )));
  }
}

class profileItemSeparator extends StatelessWidget {
  const profileItemSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          child: Container(width: 1, color: kPrimaryColor, height: 25)),
    );
  }
}

class profileItem extends StatelessWidget {
  profileItem({this.title, this.value});

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenterText(
          text: this.value,
          textColor: kPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
        CenterText(
          text: this.title,
          textColor: kPrimaryColor,
          fontSize: 14,
        )
      ],
    );
  }
}
