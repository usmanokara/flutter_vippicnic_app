import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class SingleChatScreen extends StatefulWidget {
  static String ID = "/single_chat_screen";

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back,
                          color: kPrimaryColor, size: 40)),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserCircleAvatar(
                          size: 40,
                          url:
                              "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
                        ),
                        Expanded(
                          child: CenterText(
                            text: "usernamejshh",
                            textColor: kPrimaryColor,
                            fontSize: 20,
                            maxLines: 1,
                            isCenter: true,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kSecondryColor),
                      child: Center(
                          child: Icon(Icons.search,
                              color: Colors.white, size: 30))),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    sendMessageItem(
                      message: "Lorem Ipsum ?",
                    ),
                    ReceiveMessageItem(
                      message:
                          "Lorem Ipsum is simply dummy text of the printing and industry. ",
                    ),
                    sendMessageItem(
                      message: "Thanks, i'll be there.",
                    ),
                    sendMessageItem(
                        message:
                            "Lorem Ipsum is simply dummy text of the printing and industry. "),
                    sendMessageItem(
                        message:
                            "Lorem Ipsum is simply dummy text of the printing and industry. "),
                    ReceiveMessageItem(
                        message:
                            "Lorem Ipsum is simply dummy text of the printing and industry. "),
                    ReceiveMessageItem(
                        message:
                            "Lorem Ipsum is simply dummy text of the printing and industry. ")
                  ],
                ),
              )),
              Row(
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
                                width: 25,
                                height: 25,
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
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                "assets/svg/file.svg",
                                width: 25,
                                height: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(
                                "assets/svg/photo.svg",
                                width: 20,
                                height: 20,
                              ),
                            )
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
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiveMessageItem extends StatelessWidget {
  ReceiveMessageItem({this.message});

  String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          UserCircleAvatar(
            url:
                "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ed660c99e384f0007b7db21%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D0%26cropX2%3D1080%26cropY1%3D0%26cropY2%3D1080",
            size: 40,
          ),
          Expanded(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor.withOpacity(0.1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CenterText(
                                text: this.message,
                                textColor: kPrimaryColor,
                                fontSize: 16),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Spacer(),
                                CenterText(
                                    text: "11:21 AM",
                                    textColor: kPrimaryColor,
                                    fontSize: 11),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 1,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/svg/corner2.svg",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class sendMessageItem extends StatelessWidget {
  sendMessageItem({this.message});

  String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF19623C)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CenterText(
                              text: this.message,
                              textColor: Colors.white,
                              fontSize: 14,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Spacer(),
                                CenterText(
                                    text: "11:21 AM",
                                    textColor: Colors.white,
                                    fontSize: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5)
                  ],
                ),
                Positioned(
                    top: 1,
                    right: 0,
                    child: SvgPicture.asset(
                      "assets/svg/corner1.svg",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ))
              ],
            ),
          ),
          UserCircleAvatar(
            url:
                "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
            size: 40,
          )
        ],
      ),
    );
  }
}
