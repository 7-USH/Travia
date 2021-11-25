//flutter run --no-sound-null-safety
// ignore_for_file: prefer_const_constructors
// ignore: unused_import
import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/Screens/favourites_screen.dart';
import 'package:final_project/Screens/google_map.dart';
import 'package:final_project/Screens/illustration_screen.dart';
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
        initialRoute: ConcentricTransistion.id,
        routes: {
          ConcentricTransistion.id:(context)=>ConcentricTransistion(),
          LoginScreen.id: (context) => LoginScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          MainScreen.id: (context) => MainScreen(),
          FavouriteScreen.id:(context)=>FavouriteScreen(),
          GoogleScreen.id:(context)=>GoogleScreen()
        },
      ),
    );
  }
}
