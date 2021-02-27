import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/home_screens/post_detail_screen.dart';
import 'package:vippicnic/utils/constants.dart';

import 'cache_image.dart';
import 'center_text.dart';

class UserPost extends StatefulWidget {
  UserPost({this.imageList, this.message, this.userName, this.userImage});

  List<String> imageList;
  String userName;
  String message;
  String userImage;

  @override
  _UserPostState createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserCircleAvatar(
              url: widget.userImage,
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
                            text: widget.userName,
                            textColor: kPrimaryColor,
                            fontSize: 18,
                            textStyle: GoogleFonts.openSans(),
                            fontWeight: FontWeight.w900,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              color: kPrimaryColor.withOpacity(0.10),
                              child: SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                          CenterText(
                            text: "11 fev",
                            textColor: kPrimaryColor.withOpacity(0.50),
                            fontSize: 16,
                            textStyle: GoogleFonts.openSans(),
                            fontWeight: FontWeight.w900,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      CenterText(
                        maxLines: 2,
                        text: widget.message,
                        textColor: kPrimaryColor.withOpacity(1),
                        fontSize: 18,
                        textStyle: GoogleFonts.openSans(),
                      )
                    ],
                  ),
                ))
          ],
        ),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      imageIndex = index;
                    });
                  },
                  children: widget.imageList.map((e) {
                    return AppCacheImage(
                      onTap: () =>
                          Navigator.pushNamed(context, PostDetailScreen.ID),
                      width: double.infinity,
                      height: 250,
                      imageUrl: e,
                    );
                  }).toList(),
                ),
              ),
              if (widget.imageList.length > 1)
                Positioned(
                    top: 10,
                    right: 10,
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
                              widget.imageList.length.toString(),
                          textColor: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ))
            ],
          ),
        ),
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
        Divider(
          height: 1,
          color: kPrimaryColor.withOpacity(0.30),
        )
      ],
    );
  }
}

class ActionWidget extends StatelessWidget {
  ActionWidget({this.text, this.icon, this.onTap});

  String text;
  String icon;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/$icon",
            width: 30, height: 30, color: kPrimaryColor.withOpacity(0.55)),
        CenterText(
            text: text,
            textColor: kPrimaryColor.withOpacity(0.55),
            fontSize: 25)
      ],
    );
  }
}

class UserCircleAvatar extends StatelessWidget {
  UserCircleAvatar({this.url, this.size});

  String url;
  double size;

  Widget build(BuildContext context) {
    size = size ?? 70;
    return Card(
      elevation: 5,
      shape: CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: AppCacheImage(
          width: size,
          height: size,
          round: size / 2,
          imageUrl: url,
        ),
      ),
    );
  }
}

class UserRoundAvatar extends StatelessWidget {
  UserRoundAvatar({this.url});

  String url;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: AppCacheImage(
        width: 70,
        height: 70,
        round: 10,
        imageUrl: url,
      ),
    );
  }
}
