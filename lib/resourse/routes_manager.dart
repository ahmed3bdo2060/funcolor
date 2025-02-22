import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/resourse/string_manager.dart';
import 'package:funcolor/screens/game_board/screen1.dart';
import 'package:funcolor/screens/my_painting/my_painting.dart';
import 'package:funcolor/screens/my_painting/pages/animal_page.dart';
import 'package:funcolor/win_screen.dart';

import '../screens/color_mixing/color_mixing.dart';
import '../screens/coloring_animal/paint_screen.dart';
import '../testbrush.dart';


class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String onBoardingRoute = "/onBoarding";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String gameBoard = "/gameBoard";
  static const String myPaintingPage = "/MyPaintingPage";
  static const String animalPage= "/animalPage";
  static const String winPage= "/winPage";
  // static const String coloringScreen= "/coloringScreen";
  // static const String coloringPage= "/ColoringScreen2";
  static const String duckColor= "/duckColor";
  static const String bearColor= "/bearColor";
  static const String giraffeColor= "/giraffeColor";
  static const String elephantColor= "/elephantColor";
  static const String lionColor= "/lionColor";
  static const String tigerColor= "/tigerColor";
  static const String turtleColor= "/turtleColor";
  static const String beeColor= "/beeColor";
  static const String lion2Color= "/lion2Color";
  static const String kangarooColor= "/kangarooColor";
  static const String paintScreen= "/PaintScreen";

}
// class RouteGenerator{
//   static Route<dynamic> getRoute(RouteSettings routeSettings){
//     switch(routeSettings.name){
//       case Routes.gameBoard:
//         return MaterialPageRoute(builder: (_)=> const GameBoard());
//       case Routes.myPaintingPage:
//         return MaterialPageRoute(builder: (_)=> const MyPaintingPage());
//       case Routes.animalPage:
//         return MaterialPageRoute(builder: (_)=> const AnimalPage());
//       // case Routes.coloringScreen:
//       //   return MaterialPageRoute(builder: (_)=> const ColoringScreen());
//       // case Routes.coloringPage:
//       //   return MaterialPageRoute(builder: (_)=> ColoringScreen2());
//       case Routes.duckColor:
//         return MaterialPageRoute(builder: (_)=> const PaintScreen(uncoloredImage: ImageAssets.duckUnColored,coloredImage: ImageAssets.duckColored,));
//       case Routes.bearColor:
//         return MaterialPageRoute(builder: (_)=> const PaintScreen(uncoloredImage: ImageAssets.unColoredBear, coloredImage: ImageAssets.duckColored));
//       default:
//         return unDefinedRoute();
//     }
//   }
//   static Route<dynamic> unDefinedRoute(){
//     return MaterialPageRoute(builder: (_)=>Scaffold(
//       appBar: AppBar(
//         title: Text(AppStrings.noRouteFound),
//       ),
//       body: Center(
//         child: Text(AppStrings.noRouteFound),
//       ),
//     ));
//   }
// }
Map<String,Widget Function(BuildContext)> RoutesGenerator={
  Routes.gameBoard:(context) =>GameBoard(),
  Routes.myPaintingPage:(context) => MyPaintingPage(),
  Routes.animalPage:(context) => AnimalPage(),
  // Routes.animalPage:(context) => AnimalPage(),
  Routes.winPage:(context) => WinScreen(),
  // Routes.paintScreen:(context) => ColorMixingGame(),
  // "/colorMixingScreen":(context) => ColorMixingScreen(),
  // Routes.coloringScreen:(context) => ColoringScreen(),
  // Routes.coloringPage:(context) => ColoringScreen2(),
  Routes.duckColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.duckUnColored,coloredImage: ImageAssets.duckColored),
  Routes.bearColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredBear,coloredImage: ImageAssets.bearColored),
  Routes.giraffeColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredGiraffe,coloredImage: ImageAssets.giraffeColored),
  Routes.elephantColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredElephant2,coloredImage: ImageAssets.elephantColored),
  Routes.lionColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredLion,coloredImage: ImageAssets.lionColored),
  Routes.tigerColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredTiger,coloredImage: ImageAssets.tigerColored),
  Routes.turtleColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredTurtle,coloredImage: ImageAssets.turtleColored),
  Routes.beeColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredBee,coloredImage: ImageAssets.beeColored),
  Routes.lion2Color:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredLion2,coloredImage: ImageAssets.lion2Colored),
  Routes.kangarooColor:(context) => PaintScreen2(uncoloredImage: ImageAssets.unColoredKangaroo,coloredImage: ImageAssets.kangarooColored),
};