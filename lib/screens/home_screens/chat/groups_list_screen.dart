import 'package:flutter/cupertino.dart';
import 'package:vippicnic/screens/home_screens/chat/multiple_chat_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';
import 'package:vippicnic/widgets/user_post.dart';

import '../ChatListScreen.dart';

class GroupLIstScreen extends StatefulWidget {
  @override
  _GroupLIstScreenState createState() => _GroupLIstScreenState();
}

class _GroupLIstScreenState extends State<GroupLIstScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GroupChatLIstItem(),
          GroupChatLIstItem(),
          GroupChatLIstItem(),
          GroupChatLIstItem(),
        ],
      ),
    );
  }
}

class GroupChatLIstItem extends StatelessWidget {
  GroupChatLIstItem({this.image, this.time});

  String image;
  String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, MultipleChatScreen.ID),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor.withOpacity(0.05)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCacheImage(
                  width: 60,
                  height: 60,
                  round: 10,
                  imageUrl:
                      "https://yt3.ggpht.com/ytc/AAUvwnhzvaxJpwB_A0o9pMGjS2Kj2ZbtGJ40myJfKm858A=s900-c-k-c0x00ffffff-no-rj",
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CenterText(
                        text: "Event Name",
                        textColor: kPrimaryColor,
                        fontSize: 16,
                        textStyle: TextStyle(fontFamily: 'open_semibold'),
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CenterText(
                              maxLines: 2,
                              text: "8 members",
                              textColor: kPrimaryColor.withOpacity(1),
                              fontSize: 15,
                            ),
                          ),
                          CenterText(
                            text: "11 March",
                            textColor: kPrimaryColor.withOpacity(0.8),
                            fontSize: 15,
                          )
                        ],
                      ),
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
