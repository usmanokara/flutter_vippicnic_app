import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/chat/create_group_screen.dart';
import 'package:vippicnic/screens/home_screens/chat/single_chat_list_screen.dart';
import 'package:vippicnic/screens/home_screens/chat/single_chat_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

import 'chat/groups_list_screen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [SingleChatListScreen(), GroupLIstScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Card(
        shape: CircleBorder(),
        color: Colors.white,
        margin: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            if (selectedIndex == 1)
              Navigator.pushNamed(context, CreateGroupScreen.ID);
          },
          child: Icon(
            Icons.add_circle,
            color: Color(0xFF19623C),
            size: 70,
          ),
        ),
      ),
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
                  Icon(Icons.arrow_back, color: Colors.white, size: 40),
                  Expanded(
                    child: CenterText(
                      text: "Messages",
                      textColor: kPrimaryColor,
                      fontSize: 20,
                      isCenter: true,
                    ),
                  ),
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
              Row(
                children: [
                  ChatOptionItem(
                    isSelected: selectedIndex == 0,
                    text: "Chat",
                    onClick: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ChatOptionItem(
                    isSelected: selectedIndex == 1,
                    text: "Groups",
                    onClick: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: screens[selectedIndex])
            ],
          ),
        ),
      ),
    );
  }
}

class ChatLIstItem extends StatelessWidget {
  const ChatLIstItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, SingleChatScreen.ID),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor.withOpacity(0.05)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserCircleAvatar(
                  url:
                      "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
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
                          Expanded(
                            child: CenterText(
                              text: "UserName",
                              textColor: kPrimaryColor,
                              fontSize: 16,
                              textStyle: TextStyle(fontFamily: 'open_semibold'),
                            ),
                          ),
                          CenterText(
                            text: "Today",
                            textColor: kPrimaryColor.withOpacity(0.8),
                            fontSize: 14,
                            textStyle: TextStyle(fontFamily: 'open_regular'),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      CenterText(
                        maxLines: 2,
                        text: "Hi Good morning, how we...",
                        textColor: kPrimaryColor.withOpacity(1),
                        fontSize: 15,
                        textStyle: TextStyle(fontFamily: 'open_regular'),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatOptionItem extends StatelessWidget {
  ChatOptionItem({this.text, this.isSelected, this.onClick});

  String text;
  bool isSelected;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onClick,
      child: Container(
        decoration: BoxDecoration(
            color: !isSelected ? Colors.transparent : kPrimaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          child: CenterText(
              text: this.text,
              textColor: isSelected ? Colors.white : kPrimaryColor,
              fontSize: 20),
        ),
      ),
    );
  }
}
