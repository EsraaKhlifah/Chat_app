import 'package:firebase1/register_screen.dart';
import 'package:firebase1/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Home.dart';
import 'addnots.dart';
import 'chats.dart';
import 'login.dart';

final _auth =FirebaseAuth.instance;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

       // home:ChatsScreen(),
      initialRoute: _auth.currentUser!=null?ChatsScreen.Screenrote:HomePage.Screenrote,
    routes:{
       HomePage.Screenrote:(context)=>HomePage(),
      LoginScreen.Screenrote:(context)=>LoginScreen(),
      regestration.Screenrote:(context)=>regestration(),
      ChatsScreen.Screenrote:(context)=>ChatsScreen(),



    } ,
    );


  }
}
