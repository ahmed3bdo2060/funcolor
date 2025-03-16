import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

 const String _authImagesPath = "assets/images/auth_images";
 const String _gameBoardImagesPath = "assets/images/game_board";
 const String _myPaintingImagesPath = "assets/images/mypainting_images";
 const String _myColorMixingImagePath = "assets/images/color_mixing_images";
 const String _myColorMatchImagePath = "assets/images/color_match_images";

class AppImages {

/* Landing Page */
  static const String landingBg = "$_authImagesPath/landing_page_bg.png";
  static const String landingChildImage = "$_authImagesPath/landing_page_img.png";
  static const String purbleBtnBg = "$_authImagesPath/purbleBtn.png";
  static const String redBtnBg = "$_authImagesPath/redBtn.png";

  /* Login Page */
  static const String loginBg = "$_authImagesPath/login_bg.png";
  static const String logo = "$_authImagesPath/Logo.svg";

  /* forget Password page */
  static const String gradientBg = "$_authImagesPath/gradient_bg.png";
  static const String curvedBtmCardBg = "$_authImagesPath/curvedBtmCardBg.png";

  /* add profile info page */
  static const String cardBg = "$_authImagesPath/cardBg.png";
  static const String defaultUploadImage = "$_authImagesPath/uploadimg.png";
 
  /// ****************** Game Board **********************
  
    static const String cardBoard = "$_gameBoardImagesPath/cardBoard.png";
    static const String colorMixing = "$_gameBoardImagesPath/colormixing.png";
    static const String learningColors = "$_gameBoardImagesPath/learningcolor.png";
    static const String matchColors = "$_gameBoardImagesPath/matchcolor.png";
    static const String myPainting = "$_gameBoardImagesPath/mypainting.png";
    static const String lightGameBoard = "$_gameBoardImagesPath/lightGameBoard.png";
    static const String darkGamBoard = "$_gameBoardImagesPath/darkGamBoard.png";
    static const String yellowshadow = "$_gameBoardImagesPath/yellowshadow.svg";
    static const String childPhoto = "$_gameBoardImagesPath/childPhoto.png";
    static const String childphotoframe = "$_gameBoardImagesPath/childphotoframe.png";

    ///********************* My Painting *********************/
    static const String paintingGirl = "$_myPaintingImagesPath/paintingGirl.svg";
    static const String myPaintingCardBg = "$_myPaintingImagesPath/myPaintingCardBg.png";
    static const String animals = "$_myPaintingImagesPath/animals.png";
    static const String charactersClosed = "$_myPaintingImagesPath/charactersClosed.png";
    static const String charactersOpened = "$_myPaintingImagesPath/charactersOpened.png";
    static const String dinasourClosed = "$_myPaintingImagesPath/dinasourClosed.png";
    static const String dinasourOpened = "$_myPaintingImagesPath/dinasourOpened.png";
    static const String fishes = "$_myPaintingImagesPath/fishes.png";
    static const String flowers = "$_myPaintingImagesPath/flowers.png";
    static const String paintByNumbersClosed = "$_myPaintingImagesPath/paintByNumbersClosed.png";
    static const String paintByNumbersOpened = "$_myPaintingImagesPath/paintByNumbersOpened.png";
    static const String placesClosed = "$_myPaintingImagesPath/placesClosed.png";
    static const String placesOpened = "$_myPaintingImagesPath/placesOpened.png";
    static const String vehiclesClosed = "$_myPaintingImagesPath/vehiclesClosed.png";
    static const String vehiclesOpen = "$_myPaintingImagesPath/vehiclesOpen.png";
    static const String duckFram = "$_myPaintingImagesPath/duckFram.png";
    static const String bearFram = "$_myPaintingImagesPath/bearFram.png";
    static const String beeFram = "$_myPaintingImagesPath/beeFram.png";
    static const String catFram = "$_myPaintingImagesPath/catFram.png";
    static const String elephantFram = "$_myPaintingImagesPath/elephantFram.png";
    static const String girafeFram = "$_myPaintingImagesPath/girafeFram.png";
    static const String kangarooFram = "$_myPaintingImagesPath/kangarooFram.png";
    static const String lionBabyFram = "$_myPaintingImagesPath/lionBabyFram.png";
    static const String lionFram = "$_myPaintingImagesPath/lionFram.png";
    static const String turtleFram = "$_myPaintingImagesPath/turtleFram.png";
    static const String bearuncolored = "$_myPaintingImagesPath/bearuncolored.svg";
    static const String beeuncolored = "$_myPaintingImagesPath/beeuncolored.svg";
    static const String coloredduck = "$_myPaintingImagesPath/coloredduck.svg";
    static const String catuncolored = "$_myPaintingImagesPath/catuncolored.svg";
    static const String duckuncolored = "$_myPaintingImagesPath/duckuncolored.svg";
    static const String elephantuncolored = "$_myPaintingImagesPath/elephantuncolored.svg";
    static const String giraffeuncolored = "$_myPaintingImagesPath/giraffeuncolored.svg";
    static const String kangarouncolored = "$_myPaintingImagesPath/kangarouncolored.svg";
    static const String lionBabyuncolored = "$_myPaintingImagesPath/lionBabyuncolored.svg";
    static const String turtleuncolored = "$_myPaintingImagesPath/turtleuncolored.svg";
    static const String lionuncolored = "$_myPaintingImagesPath/lionuncolored.svg";
    static const String duckUncolored = "$_myPaintingImagesPath/duckUncolored.png";

  ///********************* Color Mixing *********************/
  static const String colorMixingGirl = "$_myColorMixingImagePath/colormixinggirl.svg";
  static const String colorMixingGirl2 = "$_myColorMixingImagePath/colormixinggirl.png";
  static const String number1 = "$_myColorMixingImagePath/number1.png";
  static const String number2 = "$_myColorMixingImagePath/number2.png";
  static const String number3 = "$_myColorMixingImagePath/number3.png";
  static const String number4 = "$_myColorMixingImagePath/number4.png";
  static const String number5 = "$_myColorMixingImagePath/number5.png";
  static const String number6 = "$_myColorMixingImagePath/number6.png";

  ///********************* Color Mixing samples *********************/
  static const String colorPurple = "$_myColorMixingImagePath/colorpurple.svg";
  static const String colorRed = "$_myColorMixingImagePath/colorred.svg";
  static const String colorYellow = "$_myColorMixingImagePath/coloryellow.svg";
  static const String colorOrange = "$_myColorMixingImagePath/colororange.svg";
  static const String colorGreen = "$_myColorMixingImagePath/colorgreen.svg";
  static const String colorBrown = "$_myColorMixingImagePath/colorbrown.svg";
  static const String colorBurple = "$_myColorMixingImagePath/colorburple.svg";
  static const String colorPink = "$_myColorMixingImagePath/colorpink.svg";
  static const String colorDarkOrange = "$_myColorMixingImagePath/colordarkorang.svg";
  static const String colorBlueGreen = "$_myColorMixingImagePath/colorbluegreen.svg";
  static const String blueColorLevelForMix = "$_myColorMixingImagePath/bluecolorlevelformix.svg";
  static const String redColorLevelForMix = "$_myColorMixingImagePath/redcolorformix.svg";
  static const String yellowColorLevelForMix = "$_myColorMixingImagePath/yellowcolorformix.svg";
  static const String greenColorLevelForMix = "$_myColorMixingImagePath/greencolorformix.svg";
  static const String mixedColor = "$_myColorMixingImagePath/mixedcolor1.png";
  static const String mixedColor1 = "$_myColorMixingImagePath/mixedcolor.svg";
  static const String mixedColored = "$_myColorMixingImagePath/mixedcolored.png";
  static const String plus = "$_myColorMixingImagePath/plus.svg";
  static const String equal = "$_myColorMixingImagePath/equal.svg";
  static const String questionMark = "$_myColorMixingImagePath/questionmark.svg";
  static const String colorLevelGreen = "$_myColorMixingImagePath/colorlevelgreen.svg";
  static const String colorLevelPurple = "$_myColorMixingImagePath/colorlevelpurple.svg";
  static const String colorLevelYellow = "$_myColorMixingImagePath/colorlevelyellow.svg";
  static const String colorLevelOrange = "$_myColorMixingImagePath/colorlevelorange.svg";
  static const String colorLevelBrown = "$_myColorMixingImagePath/colorlevelbrown.svg";
  static const String colorLevelPink = "$_myColorMixingImagePath/colorlevelpink.svg";
  static const String colorLevelBlueGreen = "$_myColorMixingImagePath/colorlevelbluegreen.svg";
  static const String colorLevelDarkOrange = "$_myColorMixingImagePath/colorleveldarkorange.svg";
  static const String colorLevelBluePurple = "$_myColorMixingImagePath/colorlevelbluepurple.svg";
  static const String dvider = "$_myColorMixingImagePath/dvider.svg";

  ///**************************** Color Match *****************************/
  static const String colorMatchCardBg = "$_myColorMatchImagePath/colormatchbackground.svg";
  static const String colorMatchShapes = "$_myColorMatchImagePath/colormatchshapes.png";
  static const String colorMatchFoods = "$_myColorMatchImagePath/colormatchfoods.png";
  static const String colorMatchAnimals = "$_myColorMatchImagePath/colormatchanimals.png";
  static const String colorMatchNumbers = "$_myColorMatchImagePath/colormatchnumbers.png";
  ///**************************** Color Match Shapes *****************************/
  static const String emptyOrangColorMatchShapes = "$_myColorMatchImagePath/emptyorangcolormatchshapes.svg";
  static const String emptyBlueColorMatchShapes = "$_myColorMatchImagePath/emptybluecolormatchshapes.svg";
  static const String emptyPurpleColorMatchShapes = "$_myColorMatchImagePath/emptypurplecolormatchshapes.svg";
  static const String emptyGreenColorMatchShapes = "$_myColorMatchImagePath/emptygreencolormatchshapes.svg";
  static const String emptyYellowColorMatchShapes = "$_myColorMatchImagePath/emptyyellowcolormatchshapes.svg";
  static const String emptyRedColorMatchShapes = "$_myColorMatchImagePath/emptyredcolormatchshapes.svg";
///**************************** Color Match Foods *****************************/
  static const String carrot = "$_myColorMatchImagePath/carrot1.svg";
  static const String eggplant= "$_myColorMatchImagePath/eggplant1.svg";
  static const String cabbage = "$_myColorMatchImagePath/cabbage1.svg";
  static const String tomato = "$_myColorMatchImagePath/tomato1.svg";
  static const String banana = "$_myColorMatchImagePath/banana1.svg";
  static const String unColoredArea = "$_myColorMatchImagePath/uncoloredarea.svg";
  static const String foodsColorMatchPurple = "$_myColorMatchImagePath/foodscolormatchpurple.svg";
  static const String foodsColorMatchOrange = "$_myColorMatchImagePath/foodscolormatchorange.svg";
  static const String foodsColorMatchGreen = "$_myColorMatchImagePath/foodscolormatchgreen.svg";
  static const String foodsColorMatchYellow = "$_myColorMatchImagePath/foodscolormatchyellow.svg";
  static const String foodsColorMatchRed = "$_myColorMatchImagePath/foodscolormatchred.svg";
  ///**************************** Color Match Animals *****************************/
  static const String animalColorMatchTiger = "$_myColorMatchImagePath/animalcolormatchtiger.svg";
  static const String animalColorMatchFish = "$_myColorMatchImagePath/animalcolormatchfish.svg";
  static const String animalColorMatchInsect = "$_myColorMatchImagePath/animalcolormatchinsect.svg";
  static const String animalColorMatchFrog = "$_myColorMatchImagePath/animalcolormatchfrog.svg";
  static const String animalColorMatchColoredBird = "$_myColorMatchImagePath/animalcolormatchcoloredbird.svg";
  static const String animalColorMatchBird = "$_myColorMatchImagePath/animalcolormatchbird.svg";
  static const String animalColorMatchUnicorn = "$_myColorMatchImagePath/animalcolormatchunicorn.svg";
}



/* logo image */

 Widget logoImage =  SvgPicture.asset(
                        AppImages.logo,
                        height: 128.h,
                      );

 Widget appBarlogoImage = SvgPicture.asset(
                        AppImages.logo,
                        height: 102.h,
                      );
