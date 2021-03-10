import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vippicnic/screens/home_screens/chat/single_chat_screen.dart';
import 'package:vippicnic/screens/login_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

class MultipleChatScreen extends StatefulWidget {
  static String ID = "multiple_chat_screen";

  @override
  _MultipleChatScreenState createState() => _MultipleChatScreenState();
}

class _MultipleChatScreenState extends State<MultipleChatScreen> {
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
                    child: CenterText(
                      text: "Picnic Kids",
                      textColor: kPrimaryColor,
                      fontSize: 20,
                      maxLines: 1,
                      isCenter: true,
                      fontWeight: FontWeight.w500,
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
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => showInviteBottomSheet(),
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondryColor),
                        child: Center(
                            child: Icon(Icons.person_add_alt_1,
                                color: Colors.white, size: 30))),
                  ),
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
                                        color: kPrimaryColor),
                                    hintStyle: TextStyle(
                                        fontFamily: 'open_regular',
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

  void showInviteBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (builder) {
          return new Container(
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "Send invitation",
                              textColor: kPrimaryColor,
                              fontSize: 22,
                            ),
                          ),
                          Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context, null),
                                child: Icon(
                                  Icons.cancel,
                                  color: kPrimaryColor.withOpacity(0.5),
                                  size: 30,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 15),
                      InputTyoe(
                        hint: "Type username,  email...",
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            minLines: 5,
                            maxLines: 10,
                            decoration: InputDecoration(
                                hintText: "Message...",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                labelStyle:
                                    TextStyle(fontFamily: 'open_regular'),
                                hintStyle:
                                    TextStyle(fontFamily: 'open_regular')),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xFFC4C4C4), width: 2)),
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
                                  text: "Invite to the group".toUpperCase(),
                                  textColor: Colors.white,
                                  fontSize: 20,
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
                      ),
                      SizedBox(height: 50),
                    ]),
                  ),
                )),
          );
        });
  }
}
