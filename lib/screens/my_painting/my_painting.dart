import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/screens/my_painting/widgets/painting_widgets.dart';
import '../game_board/widgets/app_bar_row.dart';
import '../game_board/widgets/bottom_navigation.dart';
import 'model.dart';

class MyPaintingPage extends StatefulWidget {
  const MyPaintingPage({super.key});

  @override
  State<MyPaintingPage> createState() => _MyPaintingPageState();
}

class _MyPaintingPageState extends State<MyPaintingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            Column(
              children: [
                AppBarRow(userName: "Adam", gameGroup: "Paintings", inSideGame: true,appBarIcon: ImageAssets.paintingIcon,),
                PaintingWidget(items: gridItems, crossAxisCount: 4, spacing: 16,pageGroup: myPaintingPages,
                    leftImage: ImageAssets.paintingGirl, insidecategory: true, insideanimals: false,),
              ],
            ),
          ],
        ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(insideGame: true,onBackPressed: () => Navigator.pop(context),),
    );
  }
}
