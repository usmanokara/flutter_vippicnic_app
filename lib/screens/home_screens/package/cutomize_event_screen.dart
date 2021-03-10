import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/profile/edit_profile_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';

class CustomizeEventScreen extends StatefulWidget {
  static String ID = "/customize_event_screen";

  @override
  _CustomizeEventScreenState createState() => _CustomizeEventScreenState();
}

class _CustomizeEventScreenState extends State<CustomizeEventScreen> {
  List<String> imageList = [
    "https://cdn-7.nikon-cdn.com/Images/Learn-Explore/Photography-Techniques/2017/Birthday-Top-10-Tips/Media/Kathy-Wolfe-Birthday-girls-balloons.low.jpg",
  ];
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 370,
                        width: double.infinity,
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              imageIndex = index;
                            });
                          },
                          children: imageList.map((e) {
                            return AppCacheImage(
                              width: double.infinity,
                              height: 250,
                              imageUrl: e,
                            );
                          }).toList(),
                        ),
                      ),
                      if (imageList.length > 1)
                        Positioned(
                            top: 10,
                            right: 10,
                            child: SafeArea(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.40)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  child: CenterText(
                                    text: (imageIndex + 1).toString() +
                                        "/" +
                                        imageList.length.toString(),
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 350),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              CenterText(
                                  text: "How it works?",
                                  textColor: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                              SizedBox(height: 10),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "",
                                  style: TextStyle(
                                    fontFamily: 'open_regular',
                                    fontSize: 18.0,
                                    color: kPrimaryColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      text: 'Book and Payment?',
                                      style: TextStyle(
                                          fontFamily: 'open_regular',
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          ' Book at least 15 days in advance, with a 50% deposit (transfer) and the remainder on the day of the event.',
                                      style:
                                          TextStyle(fontFamily: 'open_regular'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "",
                                  style: TextStyle(
                                    fontFamily: 'open_regular',
                                    fontSize: 18.0,
                                    color: kPrimaryColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                      text: 'Don\'t found something?',
                                      style: TextStyle(
                                          fontFamily: 'open_regular',
                                          decoration: TextDecoration.underline),
                                    ),
                                    TextSpan(
                                      text:
                                          ' If you want something that is not on our list, write in the "message field" and we will be happy to make your wish come true.',
                                      style:
                                          TextStyle(fontFamily: 'open_regular'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Event type",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Event theme",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "N° People",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Drinks",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Food",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Add-Ons",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Location",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Date",
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              UpdateProfileItem(
                                title: "Hour",
                                onTap: () {},
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
                                          text: "Get free Quotations"
                                              .toUpperCase(),
                                          textColor: Colors.white,
                                          fontSize: 18,
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
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  SafeArea(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 50),
                          CenterText(
                              isCenter: true,
                              text: "Customize your event",
                              textColor: Colors.white,
                              fontSize: 20)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
