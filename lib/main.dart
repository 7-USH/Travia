// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore, unnecessary_null_comparison, use_key_in_widget_constructors, avoid_types_as_parameter_names, non_constant_identifier_names
// ignore: unused_import
//flutter run --no-sound-null-safety
import 'package:final_project/Screens/colorloader.dart';
import 'package:final_project/Screens/custom_drawer.dart';
import 'package:final_project/Screens/default_page.dart';
import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/Screens/favourites_screen.dart';
import 'package:final_project/Screens/flash_screen.dart';
import 'package:final_project/Screens/google_map.dart';
import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/Screens/onboarding.dart';
import 'package:final_project/Screens/signin_screen.dart';
import 'package:final_project/accessories/favorite_card.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:final_project/services/MyThemes.dart';
import 'package:final_project/services/onboardmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Firebase.initializeApp();
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final storage=FlutterSecureStorage();
  Future<bool> checkloginstat() async
  {
    String ? value =await storage.read(key: "uid");
    if(value==null)
    {
      return false;
    }
    return true;
    }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        theme: kBackgroundTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: MyThemes.darkTheme,
        home: FutureBuilder(
          future:checkloginstat(), builder: (BuildContext context, AsyncSnapshot<bool> snapshot) { 
            if(snapshot.data==false)
            {
              return FlashScreen(
                nextPage: OnBoardingScreen(),
                duration: 3,
              );
            }
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return ColorLoader3();
            }
            return FlashScreen(nextPage: MainScreen(),duration: 3,);

           },
          ),
        routes: {
          FlashScreen.id: (context) => FlashScreen(
                nextPage: OnBoardingScreen(),
                duration: 3,
              ),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          MainScreen.id: (context) => MainScreen(),
          FavouriteScreen.id: (context) => FavouriteScreen(),
          DefaultPage.id : (context) => DefaultPage(),
        },
      ),
    );
  }
}
