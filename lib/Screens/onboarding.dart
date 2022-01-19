// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_const_constructors

import 'package:final_project/accessories/onboardbutton.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/services/onboardmodel.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = "OnBoardingScreen";
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardModel> _content = Utils.getOnBoard();
  int pageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: size.height/30),
          child: OnBoardButton(
            message: "Let's Go",
          ),
        ),
        body: Stack(children: [
          Column(
            children: [
              Center(
                  child: SafeArea(
                      child: kAppLogo(context, const Color(0xFFCE6730),
                          Colors.orange.withOpacity(0.4), 50))),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  children: List.generate(
                      _content.length,
                      (index) => Container(
                            padding:  EdgeInsets.all(size.height/30),
                            margin: EdgeInsets.only(
                                left: size.width/10, right: size.width/10, top: size.width/10, bottom: size.height/5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFFCE6730)
                                          .withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(8, 2),
                                      spreadRadius: 1)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  _content[index].img,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: size.height/12,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      _content[index].message,
                                      style: smallwelcomeText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height/1.2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _content.length,
                    (index) => Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFCE6730).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                width: 6,
                                color: pageIndex == index
                                    ? const Color(0xFFCE6730).withOpacity(0.1)
                                    : Colors.white.withOpacity(0.95),
                              )),
                        ))),
          )
        ]));
  }
}
