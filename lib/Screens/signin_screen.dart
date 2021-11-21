// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors
import 'package:final_project/accessories/animated_text.dart';
import 'package:final_project/accessories/loginbutton.dart';
import 'package:final_project/accessories/sigin_button.dart';
import 'package:final_project/accessories/wavewidget.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


class SignInScreen extends StatefulWidget {
  static String id = 'signinScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: Provider.of<Data>(context).isChanged,
      child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                WaveWidget(Colors.white, size, size.height / 3),
                Positioned(
                    top: size.height/7,
                    left: size.width / 3.71,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                            tag: 'logo',
                            child: kAppLogo(
                                context, Colors.white, Colors.white24, 50)),
                        SizedBox(
                          height: size.height/7,
                        ),
                        myAnimeText(),
                        // ignore: prefer_const_constructo
                      ],
                    )),
                // ignore:
                Positioned(
                    right: size.width/4.1,
                    bottom: size.height / 6,
                    child: Hero(
                        tag: 'button',
                        child: LoginButton(
                          text: "Register",
                        ))),
    
                Positioned(
                    right: size.width / 4.1,
                    bottom: size.height / 3.4,
                    child: SignInButton(
                      text: "SignIn",
                    ))
              ],
            ),
          )),
    );
  }
}
