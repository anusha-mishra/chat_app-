import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/widgets/chat_user_card.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
    leading: const Icon(CupertinoIcons.group),
    centerTitle: true,
    elevation: 1,
    actions: [IconButton(onPressed:(){}, icon:const Icon(Icons.search)),
    IconButton(onPressed:(){}, icon:const Icon(Icons.more_vert))
    ],
    title:const Text('We Chat',
   style: TextStyle(
    color:Colors.black,
    //fontWeight:FontWeight.bold,
    fontSize: 20
   ),) ,
   backgroundColor:Colors.blue),
   floatingActionButton: Padding(
     padding:  const EdgeInsets.only(bottom: 10),
     child:FloatingActionButton(onPressed: ()
     async{
      await APIs.auth.signOut();
      await GoogleSignIn().signOut();
     },
     child: FloatingActionButton(onPressed: (){},child:const Icon(Icons.add_comment_rounded)),
   ),

   ),
   //it is used to show so many cards.
   body: StreamBuilder(
    //we have to informfrom wher we will fetch data.//access the firestore.
    stream: APIs.firestore.collection('users').snapshots(),
    //snappshot give data like packet instead of bundle.
   builder: (context, snapshot)  {
final list=[];

    if (snapshot.hasData){
      final data= snapshot.data?.docs;
      //? means that data may be null.  ! same use 
      //loop to check how many objects are coming.
      for (var i in data!) {
         log('Data:${i.data()}');
        list.add(i.data()['name']); //we want only name.
      }//data shown in console which is provided in firestore.
    }
      return ListView.builder(
        itemCount:list.length,
      padding: EdgeInsets.only(top: mq.height*.01),
      physics:const BouncingScrollPhysics(),
      itemBuilder: (context,index){
      // ignore: prefer_const_constructors.
     //return const ChatUserCard();
     return Text('name:${list[index]}');
      }
   
   );
   }
     ),
      );
  }
}