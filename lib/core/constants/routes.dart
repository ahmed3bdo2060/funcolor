
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/features/color_match/pages/color_match.dart';
import 'package:funcolor/features/color_match/pages/color_match_animals.dart';
import 'package:funcolor/features/color_match/pages/color_match_foods.dart';
import 'package:funcolor/features/color_match/pages/color_match_shapes.dart';
import 'package:funcolor/features/color_mixing/pages/color_mixing.dart';
import 'package:funcolor/features/color_mixing/pages/color_mixing_levels.dart';
import 'package:funcolor/features/color_mixing/pages/color_mixing_sample3.dart';
import 'package:funcolor/features/color_mixing/pages/color_mixing_sample.dart';
import 'package:funcolor/features/game_board/presentation/pages/game_board_screen.dart';
import 'package:funcolor/features/my_painting/model.dart';
import 'package:funcolor/features/my_painting/pages/myPaintingScreen.dart';
import 'package:funcolor/features/my_painting/pages/my_painting_samples.dart';
import 'package:funcolor/features/my_painting/pages/paint_screen.dart';
import 'package:funcolor/win_screen.dart';

import '../../aaa.dart';
import '../../screens/coloring_animal/paint_screen.dart';
import '../../test/pagesss.dart';
import '../../testbrush.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const GameBoardScreen(),
  // '/login': (context) => const LoginScreen(),
  // '/signup': (context) => const SignUpScreen(isFirstPage: true),
  // '/addProfileInfo': (context) => const AddProfileInfoScreen(),
  // '/forgetPassword': (context) => const ForgetPasswordScreen(),
  // '/changePassword': (context) => const ChangePasswordScreen(),
  // '/deleteAccount': (context) => const DeleteAccountScreen(),
  // '/email-verification': (context) => const EmailVerificationScreen(),
  '/gameBoard': (context) => const GameBoardScreen(),
    '/mypaintingScreen': (context) => const MyPaintingScreen(),
   '/myPaintingSamples' : (context) => const MyPaintingSamples(),
   '/colorMixingScreen' : (context) => const ColorMixingScreen(),

   ///****************************************** Level 1 ***************************************************///

   '/colorMixingSampls' : (context) =>  ColorMixingSampls(images: imageSample1,
     width: 84.w,
     headText: 'Level 1- Primary Colors',
     imageWidth: 188.73.w,
     imageHeight:188.68.h,
     onTap: () {
     Navigator.of(context).pushNamed("/colorMixingLevels1");
   }, ),

   // '/colorMixingSampls3' : (context) =>  ColorMixingSampls3(),
   '/colorMixingLevels1' : (context) => const ColorMixingLevels1(firstColor: Color(0xff325EDA),
       secondColor: Color(0xffE80D15),
       resultColor: Color(0xff77398A),
       imageColor: AppImages.colorLevelPurple,
       chosseImageColor1: AppImages.colorLevelGreen,
       chosseImageColor2: AppImages.colorLevelPurple,
       chosseImageColor3: AppImages.colorLevelYellow, levelNumber: 'Level 1',
   ),
   '/colorMixingLevels1-2' : (context) => const ColorMixingLevels1(firstColor: Color(0xff325EDA),
       secondColor: Color(0xffF6CA43),
       resultColor: Color(0xff7CAE0D),
       imageColor: AppImages.colorLevelGreen,
       chosseImageColor1: AppImages.colorLevelGreen,
       chosseImageColor2: AppImages.colorLevelPurple,
       chosseImageColor3: AppImages.colorLevelYellow, levelNumber: 'Level 1',),
 '/colorMixingLevels1-3' : (context) => const ColorMixingLevels1(firstColor: Color(0xffEA0606),
     secondColor: Color(0xffF6CA43),
     resultColor: Color(0xffF29900),
     imageColor: AppImages.colorLevelOrange,
     chosseImageColor1: AppImages.colorLevelPurple,
     chosseImageColor2: AppImages.colorLevelGreen,
     chosseImageColor3: AppImages.colorLevelOrange, levelNumber: 'Level 1',),
 // '/colorMixingLevels1-4' : (context) => const ColorMixingLevels1(firstColor: Color(0xffEA0606),
 //     secondColor: Color(0xff368727),
 //     resultColor: Color(0xffF6CA43),
 //     imageColor: AppImages.colorLevelYellow,
 //     chosseImageColor1: AppImages.colorLevelBrown,
 //     chosseImageColor2: AppImages.colorLevelPurple,
 //     chosseImageColor3: AppImages.colorLevelYellow, levelNumber: 'Level 1',),

  ///********************************** Level 2 *******************************************************************///
  '/colorMixingSampls2' : (context) =>  ColorMixingSampls(images: imageSample2,
    width: 84.w,
    headText: 'Level 2- Secondary Colors',
    imageWidth: 188.73.w,
    imageHeight:188.68.h,onTap: () {
      Navigator.of(context).pushNamed("/colorMixingLevels2");
    }, ),
  '/colorMixingLevels2' : (context) => const ColorMixingLevels1(firstColor: Color(0xff77398A),
    secondColor: Color(0xffE80D15),
    resultColor: Color(0xffC905AD),
    imageColor: AppImages.colorLevelPink,
    chosseImageColor1: AppImages.colorLevelYellow,
    chosseImageColor2: AppImages.colorLevelGreen,
    chosseImageColor3: AppImages.colorLevelPink,
     levelNumber: 'Level 2',
  ),
  '/colorMixingLevels2-2' : (context) => const ColorMixingLevels1(
    firstColor: Color(0xff019A00),
    secondColor: Color(0xff0051D4),
    resultColor: Color(0xff0FB4C3),
    imageColor: AppImages.colorLevelBlueGreen,
    chosseImageColor1: AppImages.colorLevelPink,
    chosseImageColor2: AppImages.colorLevelBlueGreen,
    chosseImageColor3: AppImages.colorLevelYellow, levelNumber: 'Level 2',),
  '/colorMixingLevels3-2' : (context) => const ColorMixingLevels1(firstColor: Color(0xffFF7F00),
    secondColor: Color(0xffF6CA43),
    resultColor: Color(0xffF7A500),
    imageColor: AppImages.colorLevelOrange,
    chosseImageColor1: AppImages.colorLevelPurple,
    chosseImageColor2: AppImages.colorLevelGreen,
    chosseImageColor3: AppImages.colorLevelOrange, levelNumber: 'Level 2',),

  ///************************************ Level 3 ******************************************************************///
  '/colorMixingSampls3' : (context) =>  ColorMixingSampls(images: imageSample3,
      width: 20.w,
      headText: 'Level 3- Tertiary Colors',
      imageWidth: 150.w,
      imageHeight:150.h ,
  onTap: () {
Navigator.of(context).pushNamed("/colorMixingLevels3");
}, ),
  '/colorMixingLevels3' : (context) => const ColorMixingLevels1(firstColor: Color(0xffDB1D00),
    secondColor: Color(0xffF66F00),
    resultColor: Color(0xffF54700),
    imageColor: AppImages.colorLevelDarkOrange,
    chosseImageColor1: AppImages.colorLevelYellow,
    chosseImageColor2: AppImages.colorLevelGreen,
    chosseImageColor3: AppImages.colorLevelDarkOrange,
    levelNumber: 'Level 3',
  ),
  '/colorMixingLevels2-3' : (context) => const ColorMixingLevels1(
    firstColor: Color(0xffFDED00),
    secondColor: Color(0xff4E8D4B),
    resultColor: Color(0xffAFCC1C),
    imageColor: AppImages.colorLevelGreen,
    chosseImageColor1: AppImages.colorLevelOrange,
    chosseImageColor2: AppImages.colorLevelGreen,
    chosseImageColor3: AppImages.colorLevelDarkOrange, levelNumber: 'Level 3',),
  '/colorMixingLevels3-3' : (context) => const ColorMixingLevels1(
    firstColor: Color(0xff002AFF),
    secondColor: Color(0xff553245),
    resultColor: Color(0xff333270),
    imageColor: AppImages.colorLevelBluePurple,
    chosseImageColor1: AppImages.colorLevelBluePurple,
    chosseImageColor2: AppImages.colorLevelGreen,
    chosseImageColor3: AppImages.colorLevelDarkOrange, levelNumber: 'Level 3',),
   // '/colorMixingNextActivity' : (context) => const ColorMixingNextActivity(),
   '/colorMatchScreen' : (context) => const ColorMatchScreen(),
   '/colorMatchShapes' : (context) => const ColorMatchShapes(),
   '/colorMatchFoods' : (context) => const ColorMatchFoods(),
   '/colorMatchAnimals' : (context) => const ColorMatchAnimals(),
   '/DrawingApp' : (context) =>  DrawingApp(),
   '/coloringScreen' : (context) =>  ColoringSvgScreen(),
   // '/winScreen' : (context) =>  WinScreen(),
   '/duckColor':(context) => PaintScreen(uncoloredImage: AppImages.duckUncolored,coloredImage: AppImages.coloredduck),
  '/bearColor':(context) => PaintScreen(uncoloredImage: AppImages.bearuncolored,coloredImage: AppImages.coloredduck),
 '/giraffeColor':(context) => PaintScreen(uncoloredImage: AppImages.giraffeuncolored,coloredImage: AppImages.coloredduck),
 '/elephantColor':(context) => PaintScreen(uncoloredImage: AppImages.elephantuncolored,coloredImage: AppImages.coloredduck),
  '/lionColor':(context) => PaintScreen(uncoloredImage: AppImages.lionuncolored,coloredImage: AppImages.coloredduck),
  '/tigerColor':(context) => PaintScreen(uncoloredImage: AppImages.catuncolored,coloredImage: AppImages.coloredduck),
  '/turtleColor':(context) => PaintScreen(uncoloredImage: AppImages.turtleuncolored,coloredImage: AppImages.coloredduck),
  '/beeColor':(context) => PaintScreen(uncoloredImage: AppImages.beeuncolored,coloredImage: AppImages.coloredduck),
 '/lion2Color':(context) => PaintScreen(uncoloredImage: AppImages.lionBabyuncolored,coloredImage: AppImages.coloredduck),
 '/kangarooColor':(context) =>  PaintScreen(uncoloredImage: AppImages.kangarouncolored,coloredImage: AppImages.coloredduck),


};


