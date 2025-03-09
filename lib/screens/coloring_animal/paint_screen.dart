import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/screens/coloring_animal/widgets/color_tools.dart';
import 'package:funcolor/screens/coloring_animal/widgets/paint_canvas.dart';
import 'package:funcolor/screens/game_board/widgets/app_bar_row.dart';
import 'package:funcolor/screens/game_board/widgets/bottom_navigation.dart';

import '../../resourse/routes_manager.dart';
import '../../win_screen.dart';
import 'models/paint_state.dart';

class PaintScreen2 extends StatefulWidget {
  final String uncoloredImage;
  final String coloredImage;
  final String categoryName;
  const PaintScreen2({Key? key, required this.uncoloredImage, required this.coloredImage,  this.categoryName="Animal"}) : super(key: key);

  @override
  State<PaintScreen2> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen2> {
  final PaintState _paintState = PaintState();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children:[
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  // App Bar
                  AppBarRow(
                    userName: "adam",
                    gameGroup: "Paintings",
                    inSideGame: true,
                    appBarIcon: ImageAssets.paintingIcon,
                  ),
                  Stack(
                    children: [
                      // Title


                      // Reference Image
                       _ReferenceImage(widget.coloredImage),

                      // Paint Canvas
                      Center(
                        child: PaintCanvas(paintState: _paintState, uncoloredImage: widget.uncoloredImage,),
                      ),
                      const _TitleWidget("Animal"),
                    ],
                  ),
                ],
              ),
            ),
              // Color Tools
              Positioned(
                right: 0,
                top: 140,
                child: ColorTools(
                  selectedColor: _paintState.selectedColor,
                  onColorSelected: (color) => setState(() {
                    _paintState.setColor(color);
                  }),
                  strokeWidth: _paintState.strokeWidth,
                  onStrokeWidthChanged: (width) => setState(() {
                    _paintState.setStrokeWidth(width);
                  }),
                ),
              ),
          ]),
        ),
        bottomNavigationBar: BottomNavigation(
          insideGame: true,
          onBackPressed: () => Navigator.of(context).pop(),
        ),
      ),
        // WinScreen()
    ]);
  }
}

class _TitleWidget extends StatelessWidget {
  final String categoryName;
  const _TitleWidget(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Text(
         categoryName,
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Comic',
          ),
        ),
      ),
    );
  }
}

class _ReferenceImage extends StatelessWidget {
  final String imageColored;
  const _ReferenceImage(this.imageColored,);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 0,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF0E6FF),
              shape: BoxShape.circle,
            ),
            child:  InkWell(
              onTap: () {

              },
              child: Container(
                width: 67,
                height: 67,
                child: Image.asset(ImageAssets.help,),
              ),
            )
          ),
          const SizedBox(height: 16),
          Image.asset(
            imageColored,
            height: 320,
          ),
        ],
      ),
    );
  }
}
