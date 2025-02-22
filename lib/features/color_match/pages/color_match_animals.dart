import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';

class ColorMatchAnimals extends StatefulWidget {
  const ColorMatchAnimals({super.key});

  @override
  State<ColorMatchAnimals> createState() => _ColorMatchAnimalsState();
}

class _ColorMatchAnimalsState extends State<ColorMatchAnimals> {
  Set<String> matchedAnimals = {};

  // خريطة لتحديد الحيوانات التي لها نفس اللون
  final Map<String, List<String>> animalColorGroups = {
    AppImages.animalColorMatchTiger: [
      AppImages.animalColorMatchBird,
      AppImages.animalColorMatchFish,
    ],
  };

  void checkAnimalMatch(String selectedAnimal) {
    setState(() {
      if (animalColorGroups[AppImages.animalColorMatchTiger]?.contains(selectedAnimal) ?? false) {
        matchedAnimals.add(selectedAnimal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRow(
        gameGroup: "Color Match",
        inSideGame: true,
        appBarIcon: AppIcons.colorMatchIcon,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 52.w, left: 46.w),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 37.w),
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 67.w,
                      height: 67.h,
                      child: SvgPicture.asset(AppIcons.help),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text("Animals", style: ts64Magic400),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              height: 200.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffFFAE0F),
                borderRadius: BorderRadius.circular(180.r),
                border: Border.all(
                  color: Color(0xffD18B00),
                  width: 18.w,
                ),
              ),
              child: Center(
                child: _Card(
                  image: AppImages.animalColorMatchTiger,
                  onTap: null,
                  showCheckMark: false,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 153.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _Card(
                    image: AppImages.animalColorMatchFish,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchFish),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchFish),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    image: AppImages.animalColorMatchInsect,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchInsect),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchInsect),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    image: AppImages.animalColorMatchFrog,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchFrog),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchFrog),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    image: AppImages.animalColorMatchColoredBird,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchColoredBird),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchColoredBird),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    image: AppImages.animalColorMatchBird,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchBird),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchBird),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    image: AppImages.animalColorMatchUnicorn,
                    onTap: () => checkAnimalMatch(AppImages.animalColorMatchUnicorn),
                    showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchUnicorn),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ThreeItemsBottomNavigation(insideGame: true),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.image,
    this.onTap,
    this.showCheckMark = false,
  });

  final String image;
  final VoidCallback? onTap;
  final bool showCheckMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 160.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.4, vertical: 20),
                child: SvgPicture.asset(image),
              ),
              if (showCheckMark)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
