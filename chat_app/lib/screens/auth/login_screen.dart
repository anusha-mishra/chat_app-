

import 'dart:developer';
import 'dart:io';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/helper/dialogs.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//change the position after some duration.
bool _isAnimate =false;

  @override
  //for duration.only one time while loading the app. 
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),()
   {
    setState(() {
      _isAnimate=true;
    });
   } );
  }

_handleGoogleBtnClick(){ 
  Dialogs.showProgressbar(context,'Login');
  //logic to handle this function.
  _signInWithGoogle().then ((User) {
    //hiding the progree bar
    Navigator.pop(context);

  var user;  
    if(user!=null){
    log('\nUser:${user.user}');
  
    log('\nuserAdditionalInfo:${user.additionalUserInfo}');
    Navigator.pushReplacement
    (context,MaterialPageRoute(builder:(_)=>const HomeScreen()));
  
    }
    
  });
}
//question mark signifies then it may return null
Future<FirebaseAuth?>_signInWithGoogle() async {
  try{
    await InternetAddress.lookup('google.com');
    // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  // ignore: await_only_futures
  return await APIs.auth..signInWithCredential(credential);
  }catch(e){
    //in which function error is showing.
    log('\n_signInWithGoogle:$e');
    Dialogs.showSnackbar(context, 'something went wrong(check Internet!)');
    return null;
  }
}

  
  @override
  Widget build(BuildContext context) {
    //size of current icon.under the parent material app//getting device screen size.
    //mq=MediaQuery.of(context).size;
    return Scaffold(
   appBar: AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 1,
    title:const Text('We Chat',
   style: TextStyle(
    color:Color.fromARGB(31, 8, 7, 7),
    fontWeight:FontWeight.bold,
    fontSize: 20
   ),) ,
   backgroundColor:Colors.blue),
   //image insertion
   body:Stack(children: [
    AnimatedPositioned(
    
      //*15=15%
      top: mq.height * .15,
      width: mq.width *.5,
      right:_isAnimate? mq.width * .25:-mq.width*.5,
      duration: const Duration(seconds: 1),
      child: 
    Image.asset('images/chat.png')),
   
   //color//colorBlendMode:BlendMode.darken,used to set the background of picture margin.
   //fit:BoxFit.cover,
   //google login button
   Positioned(
      //*15=15%
      bottom: mq.height * .25,
      width: mq.width *.15,
      left: mq.width * .05,
      height: mq.height * .5,
      child:
      //design of elevated button.
       ElevatedButton.icon(
        style:ElevatedButton.styleFrom(
          backgroundColor:Color.fromARGB(255,219, 255, 178),
          shape:const StadiumBorder(),
        ) ,
        onPressed: (){
          //flip to next page.
          _handleGoogleBtnClick();
                  },
                   icon: Image.asset('images/google.png',height: mq.height *.08
        ),
        
       label: RichText
       (text: const TextSpan(
        style: TextStyle(color: Colors.black ),
        children: [
        TextSpan(text: 'LogIn with',
        style:TextStyle(fontWeight: FontWeight.w400),),
        TextSpan(text: 'Google',
        style:TextStyle(fontWeight: FontWeight.w900),
        ),
       ]
       )
       )
       )
        ),
   ]),
    );
  }
}