import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class PostDetailScreen extends StatefulWidget {
  static String ID = "post_detail_screen";

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
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
                        height: 500,
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
                      SizedBox(height: 480),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ActionWidget(
                                  text: "12",
                                  icon: "heart.svg",
                                  onTap: () {},
                                ),
                                ActionWidget(
                                  text: "12",
                                  icon: "message.svg",
                                  onTap: () {},
                                ),
                                ActionWidget(
                                  text: "12",
                                  icon: "share.svg",
                                  onTap: () {},
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      CommentItem(imageList: imageList),
                      CommentItem(imageList: imageList),
                      CommentItem(imageList: imageList),
                      CommentItem(imageList: imageList),
                      CommentItem(imageList: imageList),
                    ],
                  ),
                  SafeArea(
                    child: GestureDetector(
                      onTap: ()=>Navigator.pop(context ),
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
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                "assets/svg/emoji.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                                onChanged: (_) {},
                                decoration: InputDecoration(
                                    hintText: "Write a message...",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelStyle: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w500,
                                        color: kPrimaryColor),
                                    hintStyle: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w500,
                                        color: kPrimaryColor)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200,
                          border: Border.all(color: kGreyColor, width: 2)),
                    ),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    "assets/svg/send_message.svg",
                    width: 50,
                    height: 50,
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

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key key,
    @required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserCircleAvatar(
            url: imageList[0],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CenterText(
                      text: "username",
                      textColor: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    )
                  ],
                ),
                SizedBox(height: 5),
                CenterText(
                  maxLines: 2,
                  text: "Good eye for details.",
                  textColor: kPrimaryColor.withOpacity(1),
                  fontSize: 18,
                )
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionWidget(
                text: "",
                icon: "message.svg",
                onTap: () {},
              ),
              SizedBox(width: 10),
              ActionWidget(
                text: "",
                icon: "heart.svg",
                onTap: () {},
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
