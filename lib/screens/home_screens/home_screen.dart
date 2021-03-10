import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/search_friend_screen.dart';
import 'package:vippicnic/screens/login_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class HomeScreen extends StatefulWidget {
  static String ID = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, SearchFriendScreen.ID),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              enabled: false,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.text,
                              onChanged: (_) {},
                              decoration: InputDecoration(
                                  hintText: "Search friends",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelStyle: TextStyle(
                                      fontFamily: 'open_regular',
                                      fontWeight: FontWeight.w500,
                                      color: kPrimaryColor),
                                  hintStyle: TextStyle(
                                      fontFamily: 'open_regular',
                                      fontWeight: FontWeight.w500,
                                      color: kPrimaryColor)),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300,
                        border: Border.all(color: kGreyColor, width: 2)),
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: UserPost(
                        userImage:
                            "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
                        userName: "Username",
                        message: "It was a great event 😀",
                        imageList: [
                          "https://cdn-7.nikon-cdn.com/Images/Learn-Explore/Photography-Techniques/2017/Birthday-Top-10-Tips/Media/Kathy-Wolfe-Birthday-girls-balloons.low.jpg",
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhdGGNT4YZHN0qsiYZcKyi0qiJnuv-1Cy89QSEaP3OGKd4ybZG2TIn1iYVgBdmeGJoddQ&usqp=CAU"
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: UserPost(
                        userImage:
                            "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ed660c99e384f0007b7db21%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D0%26cropX2%3D1080%26cropY1%3D0%26cropY2%3D1080",
                        userName: "Username",
                        message: "It was a great event 😀",
                        imageList: [
                          "https://sdlivinit.com/wp-content/uploads/2019/02/BeachParty1.jpg"
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: UserPost(
                        userImage:
                            "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
                        userName: "Username",
                        message: "It was a great event 😀",
                        imageList: [
                          "https://i.ytimg.com/vi/8kIBKGZcoik/maxresdefault.jpg",
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnRBOr9Vbx3efWrkvL2Qd2isyLbMX_VREGgw&usqp=CAU"
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
