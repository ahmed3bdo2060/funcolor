import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/screens/game_board/widgets/app_bar_row.dart';
import 'package:funcolor/screens/game_board/widgets/bottom_navigation.dart';
import 'package:funcolor/screens/game_board/widgets/games_grid.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? _buildLandscapeLayout()
            : _buildPortraitLayout();
      },
    );
  }

  Widget _buildLandscapeLayout() {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor:Colors.white,
        // Color(0xff2E0036),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(ImageAssets.mainBackGround, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Column(
                children: [
                  AppBarRow(userName: 'Adam', gameGroup: "Activity Board", inSideGame: false, ),
                  const SizedBox(height: 21.84),
                  const Games(),
                  const SizedBox(height: 19),
                ],
              ),
            ),
             Positioned(
              left: 80.51,
              right: 0,
              bottom: 0,
              child: BottomNavigation(insideGame: false,onBackPressed:() {

              },onSoundPressed: () {

              },),
            ),
          ],
        ),
        // bottomNavigationBar:
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 60),
        //   child: BottomNavigation(insideGame: false),
        // ),
        // BottomNavigation(insideGame: false),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Image.asset(
        "assets/images/maskgroup.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
