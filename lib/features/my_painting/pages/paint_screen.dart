
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/features/my_painting/widgets/color_tools.dart';
import 'package:funcolor/features/my_painting/widgets/paint_canvas.dart';
import 'package:funcolor/features/my_painting/widgets/paint_state.dart';

class PaintScreen extends StatefulWidget {
  final String uncoloredImage;
  final String coloredImage;
  final String categoryName;
  const PaintScreen({
    super.key,
    required this.uncoloredImage,
    required this.coloredImage,
    this.categoryName = "Animals",
  });

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  final PaintState _paintState = PaintState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarRow(
        gameGroup: "Paintings",
        inSideGame: true,
        appBarIcon: AppIcons.paintingsIcon,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 49.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.27,
                        left: 10.w),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 67.w,
                        height: 67.h,
                        child: SvgPicture.asset(
                          AppIcons.help,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Animals",
                    style: ts64Magic400,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset(
                        AppImages.coloredduck,
                        height: 230.53.h,
                      ),
                    ),
                    Center(
                      child: PaintCanvas(
                        paintState: _paintState,
                        uncoloredImage: widget.uncoloredImage,
                        width: 203.w,
                        height: 424.h,
                      ),
                    ),
                    Positioned(
                      right: 0,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ThreeItemsBottomNavigation(
        insideGame: true,
        onBackPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
