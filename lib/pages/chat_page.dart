import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:telemed/data/json.dart';
import 'package:telemed/theme/colors.dart';
import 'package:telemed/widgets/avatar_image.dart';
import 'package:telemed/widgets/chat_item.dart';
import 'package:telemed/widgets/textbox.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Chat Room",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomTextBox(),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        chatsData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: badges.Badge(
                                  badgeColor: Colors.green,
                                  borderSide: BorderSide(color: Colors.white),
                                  position:
                                      BadgePosition.topEnd(top: -3, end: 0),
                                  badgeContent: Text(''),
                                  child: AvatarImage(
                                      chatsData[index]["image"].toString())),
                            ))),
              ),
              SizedBox(
                height: 20,
              ),
              getChatList()
            ])));
  }

  getChatList() {
    return Column(
        children: List.generate(
            chatsData.length, (index) => ChatItem(chatsData[index])));
  }
}
