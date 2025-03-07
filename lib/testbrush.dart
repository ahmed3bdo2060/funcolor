import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/win_screen.dart';

class ColorMixingLevels3 extends StatefulWidget {
  const ColorMixingLevels3({super.key});

  @override
  State<ColorMixingLevels3> createState() => _ColorMixingSamplsState();
}

class _ColorMixingSamplsState extends State<ColorMixingLevels3> {
  bool isCorrectColorPlaced = false;
  bool win = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Scaffold(
        appBar: AppBarRow(gameGroup: "Color Mixing", inSideGame: true,appBarIcon: AppIcons.colorMixingIcon,),
        body: Padding(
          padding: EdgeInsets.only(right: 52.w,left: 46.w),
          child: Column(
            children: [
              Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 37.w ),
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
                    Expanded(child: Align(alignment: AlignmentDirectional.center,
                        child: Text("Level 1",style: ts64Magic400,))),

                  ]),
              SizedBox(height: 27.74.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 68.5.w),
                child: Container(
                  color: Color(0xffF6EEFA),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.blueColorLevelForMix,height: 166.95.h, width: 180.w,),
                      SizedBox(width: 70.38.w,),
                      SvgPicture.asset(AppImages.plus,height: 71.74.h, width: 71.74.w,),
                      SizedBox(width: 82.w,),
                      SvgPicture.asset(AppImages.redColorLevelForMix,height: 157.77.h, width: 188.73.w,),
                      SizedBox(width: 70.38,),
                      SvgPicture.asset(AppImages.equal,width: 71.74,height: 33.86,),
                      SizedBox(width: 70.38,),
                      DragTarget<String>(
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            height: 181.68,
                            width: 180,
                            child: Stack(
                              children: [
                                if (isCorrectColorPlaced)
                                  Image.asset(
                                    AppImages.mixedColored,
                                    width: 180,
                                    height: 181.68,
                                    fit: BoxFit.contain,
                                  )
                                else
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.mixedColor),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppImages.questionMark,
                                        width: 35,
                                        height: 62,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                        onWillAccept: (data) => data == AppImages.colorLevelPurple && !isCorrectColorPlaced,
                        onAccept: (data) {
                          setState(() {
                            isCorrectColorPlaced = true;
                          });
                          win = true;
                        },
                      )
                    ],),
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Draggable<String>(
                    data: AppImages.colorLevelGreen,
                    feedback: SvgPicture.asset(
                      AppImages.colorLevelGreen,
                      width: 100.w,
                      height: 92.68.h,
                    ),
                    child: SvgPicture.asset(
                      AppImages.colorLevelGreen,
                      width: 100.w,
                      height: 92.68.h,
                    ),
                    childWhenDragging: SvgPicture.asset(
                      AppImages.colorLevelGreen,
                      width: 100.w,
                      height: 92.68.h,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(width: 41.w,),
                  SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                  SizedBox(width: 41.w,),
                  Draggable<String>(
                    data: AppImages.colorLevelPurple,
                    feedback: SvgPicture.asset(
                      AppImages.colorLevelPurple,
                      width: 100.w,
                      height: 93.25.h,
                    ),
                    child: SvgPicture.asset(
                      AppImages.colorLevelPurple,
                      width: 100.w,
                      height: 93.25.h,
                      color: isCorrectColorPlaced ? Colors.grey.withOpacity(0.3) : null,
                    ),
                    childWhenDragging: SvgPicture.asset(
                      AppImages.colorLevelPurple,
                      width: 100.w,
                      height: 93.25.h,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(width: 41.w,),
                  SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                  SizedBox(width: 41.w,),
                  Draggable<String>(
                    data: AppImages.colorLevelYellow,
                    feedback: SvgPicture.asset(
                      AppImages.colorLevelYellow,
                      width: 100.w,
                      height: 92.68.h,
                    ),
                    child: SvgPicture.asset(
                      AppImages.colorLevelYellow,
                      width: 100.w,
                      height: 92.68.h,
                    ),
                    childWhenDragging: SvgPicture.asset(
                      AppImages.colorLevelYellow,
                      width: 100.w,
                      height: 92.68.h,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: ThreeItemsBottomNavigation(insideGame: true),
      ),
        win==true?WinScreen():Container()
    ]);
  }
}
