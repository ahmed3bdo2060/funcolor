import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/screens/game_board/widgets/app_bar_row.dart';
import 'package:funcolor/screens/game_board/widgets/bottom_navigation.dart';
import 'package:funcolor/screens/my_painting/widgets/painting_widgets.dart';

import '../my_painting/model.dart';

class ColorMixingScreen extends StatefulWidget {
  const ColorMixingScreen({super.key});

  @override
  State<ColorMixingScreen> createState() => _ColorMixingScreenState();
}

class _ColorMixingScreenState extends State<ColorMixingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            AppBarRow(userName: "Adam", gameGroup: "ColorMixing", inSideGame: true,appBarIcon: ImageAssets.colorMixingIcon,),
            PaintingWidget(items: ColorMixingLevels, crossAxisCount: 3, spacing: 20, leftImage: ImageAssets.myPainting,hieght: 430.78,width: 393.49, insidecategory: true, pageGroup: myPaintingPages, insideanimals: false)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(insideGame: true,onBackPressed: () {
        Navigator.pop(context);
      },onHomePressed: () {
        Navigator.of(context).pushNamed("/gameBoard");
      },),
    );
  }
}
