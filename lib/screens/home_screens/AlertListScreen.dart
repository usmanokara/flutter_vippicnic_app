import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

class AlertListScreen extends StatefulWidget {
  @override
  _AlertListScreenState createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
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
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white, size: 40),
                  Expanded(
                    child: CenterText(
                      text: "Alerts",
                      textColor: kPrimaryColor,
                      fontSize: 20,
                      isCenter: true,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondryColor),
                        child: Center(
                            child: Icon(Icons.search,
                                color: Colors.white, size: 30))),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ALertItem(
                      isInvite: true,
                    ),
                    ALertItem(),
                    ALertItem(),
                    ALertItem(),
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

class ALertItem extends StatelessWidget {
  ALertItem({this.isInvite = false});

  bool isInvite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            isInvite
                ? UserCircleAvatar(
                    url:
                        "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj")
                : UserRoundAvatar(
                    url:
                        "https://badfeelingmag.com/wp-content/uploads/2021/01/39f20bbdd5d4269edc5b971e57d7e9e2.jpeg"),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenterText(
                    text: !isInvite ? "Invite to an Event" : "New Follower",
                    textColor: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                  CenterText(
                      text: "Today",
                      textColor: kPrimaryColor.withOpacity(0.5),
                      fontSize: 20)
                ],
              ),
            ),
            Icon(
              Icons.clear,
              size: 30,
              color: kPrimaryColor.withOpacity(0.5),
            )
          ],
        ),
        Divider()
      ],
    );
  }
}
