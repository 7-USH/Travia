// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/accessories/continue_button.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class UserInfoClass {
  Enum userType;
  UserInfoClass({required this.userType});

  UserData tush1 =
      UserData(text: "Enter your email", buttonStyle: buttonType.simpleText);
  UserData tush2 = UserData(
      text: "Enter your password", buttonStyle: buttonType.passwordText);

  final _auth = FirebaseAuth.instance;
  final CollectionReference userData =
      FirebaseFirestore.instance.collection("Users");

  late String email = tush1.getInfo;
  late String password = tush2.getInfo;
  final storage = FlutterSecureStorage();
  // final user = FirebaseAuth.instance.currentUser!;

  adduser(String userCode, String? mail) async {
    bool isPresent = false;
    await userData.get().then((querySnapshot) {
      for (var user in querySnapshot.docs) {
        if (userCode == user.id) {
          isPresent = true;
          break;
        }
      }

      if (isPresent == false) {
        userData.doc(userCode).set({"name": mail, 'favs': []});
      }
    });
  }

  void showHalfPage(BuildContext context, String text) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 1.59,
            width: double.infinity,
            child: ListView(children: [
              Column(
                children: [
                  Text(
                    "Welcome $text",
                    style: welcomeText,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  tush1,
                  SizedBox(
                    height: 20,
                  ),
                  tush2,
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ContinueButton(onPressed: () async {
                    if (userType == UserType.newUser) {
                      print(email);
                      print(password);
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        await storage.write(
                            key: "uid", value: newUser.user?.uid);

                        Provider.of<Data>(context, listen: false)
                            .setUserUid(newUser.user?.uid);

                        if (newUser != null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.id,
                              ModalRoute.withName(MainScreen.id));
                        }
                        adduser(newUser.user!.uid, newUser.user!.email);
                      } catch (e) {
                        print(e);
                      }
                    } else if (userType == UserType.oldUser) {
                      print(email);
                      print(password);
                      try {
                        UserCredential newUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        //print(newUser.user?.uid);
                        await storage.write(
                            key: "uid", value: newUser.user?.uid);

                        Provider.of<Data>(context, listen: false)
                            .setUserUid(newUser.user?.uid);

                        print(Provider.of<Data>(context, listen: false)
                            .getUserUid());
                        // ignore: unnecessary_null_comparison
                        if (newUser != null) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              MainScreen.id, (Route<dynamic> route) => false);
                          // Provider.of<Data>(context).fieldText.clear();
                        }
                        adduser(newUser.user!.uid, newUser.user!.email);
                      } catch (e) {
                        print(e);
                      }
                    }
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      autofocus: true,
                      onPressed: () {
                        launch("mailto:tush1245@gmail.com");
                      },
                      child: Text(
                        "Let us know if your facing any issue !",
                        style: kMainScreenText,
                      )),
                ],
              ),
            ]),
          );
        });
  }
}

// ignore: must_be_immutable
class UserData extends StatefulWidget {
  String text;
  Enum buttonStyle;
  late String getInfo;

  UserData({
    Key? key,
    required this.text,
    required this.buttonStyle,
  }) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      height: 50,
      width: size.width / 1.4,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kbackGroundColor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0.2, 5),
                spreadRadius: 1,
                blurRadius: 8),
            BoxShadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(-3, -4),
                spreadRadius: -2,
                blurRadius: 20),
          ]),
      child: TextField(
        keyboardType: widget.buttonStyle == buttonType.simpleText
            ? TextInputType.emailAddress
            : TextInputType.text,
        obscureText:
            widget.buttonStyle == buttonType.passwordText ? true : false,
        onChanged: (String value) {
          setState(() {
            widget.getInfo = value;
          });
        },
        controller: widget.buttonStyle == buttonType.simpleText
            ? Provider.of<Data>(context).emailtextController
            : Provider.of<Data>(context).passtextController,
        cursorColor: Colors.grey.shade400,
        style: kMainTextField,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.text,
          contentPadding: const EdgeInsets.only(left: 30),
        ),
      ),
    );
  }
}
