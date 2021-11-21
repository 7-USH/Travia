import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/Screens/signin_screen.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        theme: kBackgroundTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          MainScreen.id: (context) => MainScreen(),
        },
      ),
    );
  }
}
