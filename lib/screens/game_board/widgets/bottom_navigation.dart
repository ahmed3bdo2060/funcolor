import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:funcolor/resourse/assets_manager.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.insideGame,
    this.onBackPressed,
    this.onHomePressed,
    this.onSoundPressed,
  });

  final bool insideGame;
  final VoidCallback? onBackPressed;
  final VoidCallback? onHomePressed;
  final VoidCallback? onSoundPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80.51,right: 86.51),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap:onBackPressed,
            child: insideGame==true?SlideInRight(
              duration: Duration(milliseconds: 1500),
              from: 1050,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 63),
                child: Image.asset(ImageAssets.backButton,
                  height: 81.7,
                  width: 79.08,),
              ),
            ):Image.asset(ImageAssets.logOut,
              height: 90.82,
              width: 162.72,),
          ),
          insideGame==true?GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/gameBoard");
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 636),
              child: Image.asset(ImageAssets.home,
                  width: 227,
                  height: 90.82),
            ),
          ):Container(),

          GestureDetector(
            onTap: onSoundPressed,
            child: insideGame==true?Padding(
              padding: const EdgeInsets.only(bottom: 63),
              child: Image.asset(ImageAssets.soundButton,
                height: 81.7,
                width: 79.08,),
            ):SlideInLeft(child: Padding(
              padding: const EdgeInsets.only(bottom: 63),
              child: Image.asset(ImageAssets.soundButton,
                height: 81.7,
                width: 79.08,),
            ),duration: 1500.milliseconds,
            from: 1000,),
          ),
        ],
      ),
    );
  }
}
