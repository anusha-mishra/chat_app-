import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//change the position after some duration.


  @override
  //for duration.only one time while loading the app. 
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 150),(){
      //exit full screen.
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      var color;
      SystemChrome.setEnabledSystemUIMode(
        const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent) as SystemUiMode
      );
if(APIs.auth.currentUser!=null){
  log('\nUser:${APIs.auth.currentUser}');
    log('\nuserAdditionalInfo:${APIs.auth.currentUser}');

Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
    
}else
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
    
    }
   
    
   } );
  }

  @override
  Widget build(BuildContext context) {
    //size of current icon.under the parent material app//getting device screen size.
    mq=MediaQuery.of(context).size;
    return Scaffold(
   appBar: AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 1,
    title:const Text('We Chat',
   style: TextStyle(
    color:Colors.black,
    //fontWeight:FontWeight.bold,
    fontSize: 20
   ),) ,
   backgroundColor:Colors.blue),
   //image insertion
   body:Stack(children: [
    AnimatedPositioned(
    
      //*15=15%
      top: mq.height * .15,
      width: mq.width *.5,
      right: mq.width * .25,
      duration: const Duration(seconds: 1),
      child: 
    Image.asset('images/chat.png')),
   
   //color//colorBlendMode:BlendMode.darken,used to set the background of picture margin.
   //fit:BoxFit.cover,
   //google login button
   Positioned(
      //*15=15%
      bottom: mq.height * .15,
      left: mq.width*.25,
      width: mq.width *.85,
     
    
      child:const Text('WELCOME TO CHAT APP 👋',
    
      style: TextStyle(
        fontSize: 17,color: Colors.black,letterSpacing: .5
      ),),
      
    
        ),
   ]),
    );
  }
}