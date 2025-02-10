import 'dart:ui';
import '../../resourse/assets_manager.dart';
import '../../resourse/routes_manager.dart';
import '../../resourse/string_manager.dart';

class GridItem {
  final String? title;
  final String imageUrl;
  final VoidCallback? onTap;

  GridItem({
    this.title="",
    required this.imageUrl,
    this.onTap,

  });
}
final List<String> myPaintingPages =[
  Routes.animalPage,
  Routes.gameBoard,
  Routes.gameBoard,
  Routes.myPaintingPage,
  Routes.myPaintingPage,
  Routes.myPaintingPage,
  Routes.myPaintingPage,
  Routes.myPaintingPage,

];
final List<String> animalsPicture =[
  Routes.duckColor,
  Routes.bearColor,
  Routes.giraffeColor,
  Routes.elephantColor,
  Routes.lionColor,
  Routes.tigerColor,
  Routes.turtleColor,
  Routes.beeColor,
  Routes.lion2Color,
  Routes.kangarooColor,
];
final List<GridItem>gridItems = [
  GridItem(title: AppStrings.animals, imageUrl: ImageAssets.animals, ),
  GridItem(title: AppStrings.flowers, imageUrl: ImageAssets.flowers,),
  GridItem(title: AppStrings.fishes, imageUrl: ImageAssets.fishes,),
  GridItem(title: AppStrings.vehicles, imageUrl: ImageAssets.vehicles,),
  GridItem(title: AppStrings.dinosaur, imageUrl: ImageAssets.dinosaur,),
  GridItem(title: AppStrings.characters, imageUrl: ImageAssets.characters,),
  GridItem(title: AppStrings.places, imageUrl: ImageAssets.places,),
  GridItem(title: AppStrings.paintMyNumbers, imageUrl: ImageAssets.paintMyNumbers,),

];
final List<GridItem>paintingAnimals = [
  GridItem( imageUrl: ImageAssets.duck, ),
  GridItem( imageUrl: ImageAssets.bear,),
  GridItem(imageUrl: ImageAssets.giraffe,),
  GridItem( imageUrl: ImageAssets.elephant,),
  GridItem( imageUrl: ImageAssets.lion,),
  GridItem( imageUrl: ImageAssets.tiger,),
  GridItem( imageUrl: ImageAssets.turtle,),
  GridItem( imageUrl: ImageAssets.bee,),
  GridItem( imageUrl: ImageAssets.lion2,),
  GridItem( imageUrl: ImageAssets.kangaroo,),

];