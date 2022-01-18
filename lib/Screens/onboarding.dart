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
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
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
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  children: List.generate(
                      _content.length,
                      (index) => Container(
                            padding: const EdgeInsets.all(40),
                            margin: const EdgeInsets.only(
                                left: 40, right: 40, top: 40, bottom: 150),
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
                                Text(
                                  _content[index].message,
                                  style: smallwelcomeText,
                                )
                              ],
                            ),
                          )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 690.0),
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

