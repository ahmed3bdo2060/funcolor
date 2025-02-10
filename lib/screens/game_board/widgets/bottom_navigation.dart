import 'package:flutter/material.dart';
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 63),
          child: GestureDetector(
            onTap:onBackPressed,
            child: Container(
                height: 90.82,
                width: 227,
                child: insideGame==true?Image.asset(ImageAssets.backButton,
                  height: 90.82,
                  width: 227,):Image.asset(ImageAssets.logOut,
                  height: 90.82,
                  width: 227,)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.78),
          child: insideGame==true?GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/gameBoard");
            },
            child: Container(
                height: 90.82,
                width: 227,
                child: Image.asset(ImageAssets.home,
                    width: 227,
                    height: 90.82)
            ),
          ):null,
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 63),
          child: GestureDetector(
            onTap: onSoundPressed,
            child: Container(
                height: 90.82,
                width: 227,
                child: Image.asset(ImageAssets.soundButton,
                    width: 227,
                    height: 90.82)
            ),
          ),
        ),
      ],
    );
  }
}

// GestureDetector(
// onTap: () {
//
// },
// child: Container(
// child: Image.asset(
// ImageAssets.drawer,
// width: 49,
// height: 49,
// ),)
// ),