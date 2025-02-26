
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/bottom_navigation.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/features/my_painting/model.dart';
import 'package:funcolor/features/my_painting/widgets/painting_widgets.dart';

class ColorMixingScreen extends StatefulWidget {
  const ColorMixingScreen({super.key});

  @override
  State<ColorMixingScreen> createState() => _ColorMixingScreenState();
}

class _ColorMixingScreenState extends State<ColorMixingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBarRow(
          gameGroup: "Color Mixing",
          inSideGame: true,
          appBarIcon: AppIcons.colorMixingIcon,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 45.w, right: 51.w,),
            child: Padding(
              padding:  EdgeInsets.only(top:8.7.h),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      AppImages.colorMixingGirl2,
                      height: 430.78.h,
                      width: 393.49.w,
                    ),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                    child: PaintingWidget(
                      items: colorMixingItem,
                      crossAxisCount: 3,
                      gridHeight:496.h,
                      pageGroup: colorMixingSamples,
                      insidecategory: true,
                      insideanimals: false,
                      childAspectRatio: 264 / 223.56, isColorMixing: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ThreeItemsBottomNavigation(
          insideGame: true,
          onBackPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
