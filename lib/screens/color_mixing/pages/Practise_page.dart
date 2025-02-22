import 'package:flutter/material.dart';

import '../../../resourse/assets_manager.dart';
import '../../game_board/widgets/app_bar_row.dart';

class PractisePage extends StatefulWidget {
  const PractisePage({super.key});

  @override
  State<PractisePage> createState() => _PractisePageState();
}

class _PractisePageState extends State<PractisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            AppBarRow(userName: "Adam", gameGroup: "ColorMixing", inSideGame: true,appBarIcon: ImageAssets.colorMixingIcon,),
            SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}
