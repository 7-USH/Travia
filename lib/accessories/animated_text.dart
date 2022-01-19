import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myAnimeText(context) {
  final size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width/2.5,
    height: size.height/10,
    child: FittedBox(
      child: DefaultTextStyle(
        style: GoogleFonts.kaushanScript(
          fontSize: 50,
          color: const Color(0xFFCE6730),
        ),
        child: Center(
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 500),
            animatedTexts: [
              ScaleAnimatedText('Eat'),
              ScaleAnimatedText('Sleep'),
              ScaleAnimatedText('Work'),
              ScaleAnimatedText('Travel'),
              ScaleAnimatedText('Save'),
              ScaleAnimatedText('Enjoy'),
              ScaleAnimatedText('Repeat'),
            ],
            onTap: () {
              // ignore: avoid_print
            },
            repeatForever: true,
          ),
        ),
      ),
    ),
  );
}
