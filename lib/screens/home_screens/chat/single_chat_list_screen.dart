import 'package:flutter/cupertino.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/user_post.dart';

import '../ChatListScreen.dart';

class SingleChatListScreen extends StatefulWidget {
  @override
  _SingleChatListScreenState createState() => _SingleChatListScreenState();
}

class _SingleChatListScreenState extends State<SingleChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChatLIstItem(),
          ChatLIstItem(),
          ChatLIstItem(),
          ChatLIstItem(),
        ],
      ),
    );
  }
}



