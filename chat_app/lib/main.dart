
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
// ignore: unused_import
//import 'package:chat_app/screens/auth/login_screen.dart';
//global object for accessing device screen size.
late Size mq;
// ignore: unused_import
 
Future<void> main() async{
  //for full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    

    WidgetsFlutterBinding.ensureInitialized();
 await _initializeFirebase();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Chat',
      theme: ThemeData(
        
        appBarTheme:const AppBarTheme(
          centerTitle: true,
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
    color:Colors.black12,
    fontWeight:FontWeight.normal,
    fontSize: 20),
   backgroundColor:Colors.blue)),

         // ignore: prefer_const_constructors
      home:const SplashScreen(),
    );
  }
}
_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
//await how much time the task will take.
//async-first come first serve.
//async return future object.//at present there is not data but in future then it will return.and will notify then
//stream means jaise jaise data aata jata h use pass krte jana.
//for messeges we use stream.
//async* return stream object.
}
