import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class OrderPackageScreen extends StatefulWidget {
  static String ID = "/order_package_screen";

  @override
  _OrderPackageScreenState createState() => _OrderPackageScreenState();
}

class _OrderPackageScreenState extends State<OrderPackageScreen> {
  List<String> imageList = [
    "https://cdn-7.nikon-cdn.com/Images/Learn-Explore/Photography-Techniques/2017/Birthday-Top-10-Tips/Media/Kathy-Wolfe-Birthday-girls-balloons.low.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhdGGNT4YZHN0qsiYZcKyi0qiJnuv-1Cy89QSEaP3OGKd4ybZG2TIn1iYVgBdmeGJoddQ&usqp=CAU"
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
                                  text: "What included",
                                  textColor: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                              SizedBox(height: 10),
                              CenterText(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo",
                                  textColor: kPrimaryColor,
                                  fontSize: 18),
                              SizedBox(height: 20),
                              RateItem(),
                              RateItem(),
                              RateItem(),
                              RateItem(),
                              RateItem(),
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
                                          text: "order now".toUpperCase(),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
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

class RateItem extends StatelessWidget {
  const RateItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 15,
            height: 15,
            child: SvgPicture.asset(
              "assets/svg/user.svg",
              width: 15,
              height: 15,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
      title: CenterText(
          text: "02-04 people:", textColor: kPrimaryColor, fontSize: 18),
      subtitle: CenterText(
          text: "100€ per person",
          textColor: kPrimaryColor.withOpacity(0.5),
          fontSize: 18),
    );
  }
}
