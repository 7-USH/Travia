import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/Screens/signin_screen.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kBackgroundTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes:{
        LoginScreen.id:(context)=>LoginScreen(),
        SignInScreen.id:(context)=>SignInScreen(),
        MainScreen.id:(context)=>MainScreen(),
      } ,
    );
  }
}
