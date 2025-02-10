import 'package:flutter/material.dart';

import '../../../resourse/assets_manager.dart';
import '../../game_board/widgets/app_bar_row.dart';
import '../../game_board/widgets/bottom_navigation.dart';
import '../model.dart';
import '../widgets/painting_widgets.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
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
                  PaintingWidget(items: paintingAnimals, crossAxisCount: 5, spacing: 16,pageGroup: animalsPicture,
                      leftImage: ImageAssets.paintingGirl, insidecategory: false, insideanimals: true,),
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
