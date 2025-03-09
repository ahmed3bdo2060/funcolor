import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/win_screen.dart';

class ColorMatchFoods extends StatefulWidget {
  const ColorMatchFoods({super.key});

  @override
  State<ColorMatchFoods> createState() => _ColorMatchFoodsState();
}

class _ColorMatchFoodsState extends State<ColorMatchFoods> {
  Set<String> usedColors = {};
  Set<String> matchedFoods = {};

  void showWinMessage() {
   showWinScreen(context,() {

   },);
  }

  void checkWinCondition() {
    if (matchedFoods.length == 5) { // All 5 foods are matched
      showWinMessage();
    }
  }

  Widget _buildDraggableColor(String colorImage) {
    final isUsed = usedColors.contains(colorImage);
    return Draggable<String>(
      data: isUsed ? null : colorImage,
      feedback: Material(
        color: Colors.transparent,
        child: SvgPicture.asset(
          colorImage,
          width: 128.w,
          height: 116.h,
          color: isUsed ? Colors.grey.withOpacity(0.5) : getColorForImage(colorImage).withOpacity(0.8),
        ),
      ),
      child: SvgPicture.asset(
        colorImage,
        width: 128.w,
        height: 116.h,
        color: isUsed ? Colors.grey.withOpacity(0.5) : null,
      ),
      childWhenDragging: SvgPicture.asset(
        colorImage,
        width: 128.w,
        height: 116.h,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Color getColorForImage(String image) {
    final colorMap = {
      AppImages.foodsColorMatchPurple: Color(0xff77398A),
      AppImages.foodsColorMatchOrange: Color(0xffFB8F36),
      AppImages.foodsColorMatchGreen: Color(0xff70BF01),
      AppImages.foodsColorMatchYellow: Color(0xffFFE000),
      AppImages.foodsColorMatchRed: Color(0xffDF0F1B),
    };
    return colorMap[image] ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRow(gameGroup: "Color Match", inSideGame: true, appBarIcon: AppIcons.colorMatchIcon,),
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
                      child: Text("Food",style: ts64Magic400,))),

                ]),
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 71.75.w),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Item(image: AppImages.carrot, unColoredArea: AppImages.unColoredArea, containerWidth: 147.36.w, containerHeight: 219.51.h, imageWidth:  89.94.w, imageheight: 219.51.h),
                    SizedBox(width: 48.w,),
                    _Item(image: AppImages.cabbage, unColoredArea: AppImages.unColoredArea, containerWidth: 190.w, containerHeight: 220.h, imageWidth: 130.16.w, imageheight: 150.91.h),
                    SizedBox(width: 48.w,),
                    _Item(image: AppImages.eggplant, unColoredArea: AppImages.unColoredArea, containerWidth:150.14.w, containerHeight: 189.91.h, imageWidth: 100.78.w, imageheight: 189.91.h),
                    SizedBox(width: 48.w,),
                    _Item(image: AppImages.tomato, unColoredArea: AppImages.unColoredArea, containerWidth: 195.39.w, containerHeight: 148.09.h, imageWidth: 139.17.w, imageheight: 148.09.h),
                    SizedBox(width: 48.w,),
                    _Item(image: AppImages.banana, unColoredArea: AppImages.unColoredArea, containerWidth: 163.6.w, containerHeight: 165.51.h, imageWidth: 87.99.w, imageheight: 165.51.h),
                  ],),
              ),
            ),
            SizedBox(height: 29.71.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDraggableColor(AppImages.foodsColorMatchPurple),
                SizedBox(width: 41.w,),
                SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                SizedBox(width: 41.w,),
                _buildDraggableColor(AppImages.foodsColorMatchOrange),
                SizedBox(width: 41.w,),
                SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                SizedBox(width: 41.w,),
                _buildDraggableColor(AppImages.foodsColorMatchGreen),
                SizedBox(width: 41.w,),
                SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                SizedBox(width: 41.w,),
                _buildDraggableColor(AppImages.foodsColorMatchYellow),
                SizedBox(width: 41.w,),
                SvgPicture.asset(AppImages.dvider,width: 9.w,height: 40.h,),
                SizedBox(width: 41.w,),
                _buildDraggableColor(AppImages.foodsColorMatchRed),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: ThreeItemsBottomNavigation(insideGame: true),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key, required this.image, required this.unColoredArea, required this.containerWidth, required this.containerHeight, required this.imageWidth, required this.imageheight});
  final String image;
  final String unColoredArea;
  final double imageWidth;
  final double imageheight;
  final double containerWidth;
  final double containerHeight;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  Color? areaColor;

  Map<String, Color> colorMap = {
    AppImages.foodsColorMatchPurple: Color(0xff77398A),
    AppImages.foodsColorMatchOrange: Color(0xffFB8F36),
    AppImages.foodsColorMatchGreen: Color(0xff70BF01),
    AppImages.foodsColorMatchYellow: Color(0xffFFE000),
    AppImages.foodsColorMatchRed: Color(0xffDF0F1B),
  };

  Map<String, String> foodColorMap = {
    AppImages.eggplant: AppImages.foodsColorMatchPurple,
    AppImages.carrot: AppImages.foodsColorMatchOrange,
    AppImages.cabbage: AppImages.foodsColorMatchGreen,
    AppImages.banana: AppImages.foodsColorMatchYellow,
    AppImages.tomato: AppImages.foodsColorMatchRed,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              widget.image,
              width: widget.imageWidth,
              height: widget.imageheight,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return SvgPicture.asset(
                  widget.unColoredArea,
                  height: 86.38.h,
                  width: 98.72.w,
                  color: areaColor ?? (candidateData.isNotEmpty ? colorMap[candidateData.first]?.withOpacity(0.5) : null),
                );
              },
              onWillAccept: (colorImage) {
                return colorImage == foodColorMap[widget.image] && areaColor == null;
              },
              onAccept: (colorImage) {
                setState(() {
                  areaColor = colorMap[colorImage];
                });
                final foodsState = context.findAncestorStateOfType<_ColorMatchFoodsState>();
                if (foodsState != null) {
                  foodsState.setState(() {
                    foodsState.usedColors.add(colorImage!);
                    foodsState.matchedFoods.add(widget.image);
                  });
                  foodsState.checkWinCondition();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
