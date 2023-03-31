import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../main.dart';
class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key, required ListTile child});

  @override
  State<ChatUserCard> createState() => _ChatUserCard();
}

class _ChatUserCard extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    
    return  Card(
      margin:EdgeInsets.symmetric(horizontal: mq.width*.04,vertical: 4),
      elevation: 0.5,
      color: Colors.blue,
      shape: const RoundedRectangleBorder(),
      child:const InkWell(
      //onTap:(){},
      child:ListTile(
        leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
        title:Text('Demo User') ,
        subtitle:Text('Last User Message',maxLines: 1,) ,
        trailing: Text('12:00 PM'
      ),
      ),
      ),
    );
  }
}