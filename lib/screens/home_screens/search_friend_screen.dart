import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/signup/create_account_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

import 'friend_profile_screen.dart';

class SearchFriendScreen extends StatefulWidget {
  static String ID = "/search_screen";

  @override
  _SearchFriendScreenState createState() => _SearchFriendScreenState();
}

class _SearchFriendScreenState extends State<SearchFriendScreen> {
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
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
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
                                labelStyle: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor),
                                hintStyle: GoogleFonts.openSans(
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
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
                    FriendListItem(),
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

class FriendListItem extends StatelessWidget {
  const FriendListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, FriendProfileScreen.ID),
        child: Row(
          children: [
            UserCircleAvatar(
              url:
                  "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
            ),
            SizedBox(width: 10),
            Expanded(
              child: CenterText(
                text: "UserName",
                textColor: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            OutLineCustomButton(
              text: "Follow",
              click: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class OutLineCustomButton extends StatelessWidget {
  OutLineCustomButton({this.text, this.click});

  String text;
  Function click;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      borderSide: BorderSide(
        color: kPrimaryColor.withOpacity(0.1),
        style: BorderStyle.solid,
        width: 1,
      ),
      onPressed: click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Container(
          height: 40,
          child: Center(
            child:
                CenterText(text: text, textColor: kPrimaryColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
