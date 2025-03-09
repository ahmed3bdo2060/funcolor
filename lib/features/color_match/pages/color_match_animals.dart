import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/fail_screen.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';
import 'package:funcolor/win_screen.dart';

List <BCard> checkedList = [
  BCard(image: AppImages.animalColorMatchTiger, onTap: null, showCheckMark: false),
];

class ColorMatchAnimals extends StatefulWidget {
  const ColorMatchAnimals({super.key});

  @override
  State<ColorMatchAnimals> createState() => _ColorMatchAnimalsState();
}

class _ColorMatchAnimalsState extends State<ColorMatchAnimals> {
  Set<String> matchedAnimals = {};

  @override
  void initState() {
    super.initState();
    // Reset the checkedList to only contain the tiger
    checkedList = [
      BCard(image: AppImages.animalColorMatchTiger, onTap: null, showCheckMark: false),
    ];
    matchedAnimals.clear();
  }

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
        checkedList.add(BCard(
          image: selectedAnimal,
          onTap: null,
          showCheckMark: true,
        ));
        
        // Check if all matching animals are found
        if (matchedAnimals.containsAll(animalColorGroups[AppImages.animalColorMatchTiger] ?? [])) {
          showWinScreen(context,() {

          },);
        }
      }
    });
  }

  void removeAnimal(String animalImage) {
    setState(() {
      // Don't remove the tiger
      if (animalImage != AppImages.animalColorMatchTiger) {
        checkedList.removeWhere((card) => card.image == animalImage);
        matchedAnimals.remove(animalImage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: checkedList.map((e) => _Card(
                    card: BCard(
                      image: e.image,
                      onTap: e.image == AppImages.animalColorMatchTiger ? null : () => removeAnimal(e.image),
                      showCheckMark: e.showCheckMark
                    )
                  )).toList(),
                )
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 153.h,
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _Card(
                    card: BCard(image: AppImages.animalColorMatchFish, onTap: matchedAnimals.contains(AppImages.animalColorMatchFish) ? null : () =>checkAnimalMatch(AppImages.animalColorMatchFish) ,
                        showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchFish)),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    card: BCard(image: AppImages.animalColorMatchInsect, onTap: matchedAnimals.contains(AppImages.animalColorMatchInsect) ? null : () =>checkAnimalMatch(AppImages.animalColorMatchInsect) ,
                        showCheckMark:  matchedAnimals.contains(AppImages.animalColorMatchInsect)),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    card: BCard(image: AppImages.animalColorMatchFrog, onTap: matchedAnimals.contains(AppImages.animalColorMatchFrog) ? null : () =>checkAnimalMatch(AppImages.animalColorMatchFrog) ,
                        showCheckMark:  matchedAnimals.contains(AppImages.animalColorMatchFrog)),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    card: BCard(
                      image: AppImages.animalColorMatchColoredBird,
                      onTap: matchedAnimals.contains(AppImages.animalColorMatchColoredBird)
                        ? null
                        : () => checkAnimalMatch(AppImages.animalColorMatchColoredBird),
                      showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchColoredBird)
                    ),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    card: BCard(
                      image: AppImages.animalColorMatchBird,
                      onTap: matchedAnimals.contains(AppImages.animalColorMatchBird)
                        ? null
                        : () => checkAnimalMatch(AppImages.animalColorMatchBird),
                      showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchBird)
                    ),
                  ),
                  SizedBox(width: 22.w),
                  _Card(
                    card: BCard(
                      image: AppImages.animalColorMatchUnicorn,
                      onTap: matchedAnimals.contains(AppImages.animalColorMatchUnicorn)
                        ? null
                        : () => checkAnimalMatch(AppImages.animalColorMatchUnicorn),
                      showCheckMark: matchedAnimals.contains(AppImages.animalColorMatchUnicorn)
                    ),
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
    super.key, required this.card,
  });

 final BCard card;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 160.w,
      child: InkWell(
        onTap: card.onTap,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.4, vertical: 20),
                child: SvgPicture.asset(card.image),
              ),
              if (card.showCheckMark==true)
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
class BCard {
  final String image;
  final VoidCallback? onTap;
  final bool showCheckMark;

  BCard({required this.image, required this.onTap, required this.showCheckMark});
}
