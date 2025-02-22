
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/features/my_painting/model.dart';
import 'package:funcolor/features/my_painting/widgets/painting_widgets.dart';

class ColorMatchScreen extends StatefulWidget {
  const ColorMatchScreen({super.key});

  @override
  State<ColorMatchScreen> createState() => _MyPaintingScreenState();
}

class _MyPaintingScreenState extends State<ColorMatchScreen> {
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
          gameGroup: "Color Match",
          inSideGame: true,
          appBarIcon: AppIcons.colorMatchIcon,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 45.w, right: 51.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 95.5.h,horizontal: 180.w),
                        child: SvgPicture.asset(AppImages.colorMatchCardBg,width: 822.w,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 61.w,right: 67.w,top: 60.71.h,bottom: 60.71.h),
                        child: PaintingWidget(
                          items: colorMatchItem,
                          crossAxisCount: 4,
                          gridHeight: 392.h,
                          pageGroup: colorMatchSamples,
                          insidecategory: true,
                          insideanimals: false,
                          childAspectRatio: 264.w / 392.h, isColorMixing: true,
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
        ),
      ),
    );
  }
}
