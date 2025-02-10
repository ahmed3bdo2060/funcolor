import 'package:flutter/material.dart';
import 'package:funcolor/screens/my_painting/my_painting.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../resourse/assets_manager.dart';
import '../../../resourse/color.dart';
import '../../../resourse/string_manager.dart';
import '../../../resourse/values_manager.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: _buildContainerDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildGameItems(context),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: ColorManager.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(AppRadius.r180),
      border: GradientBoxBorder(
        gradient: LinearGradient(
          colors: [ColorManager.borderColor, ColorManager.borderColor2],
        ),
        width: AppSize.s5,
      ),
    );
  }

  List<Widget> _buildGameItems(BuildContext context) {
    return [
      _buildGameItem(
        context: context,
        image: ImageAssets.myPainting,
        title: AppStrings.myPainting,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPaintingPage()),
        ),
      ),
      _buildGameItem(
        context: context,
        image: ImageAssets.colorMixing,
        title: AppStrings.colorMixing,
        onTap: () {},
      ),
      _buildGameItem(
        context: context,
        image: ImageAssets.matchColor,
        title: AppStrings.matchColors,
        onTap: () {},
      ),
      _buildGameItem(
        context: context,
        image: ImageAssets.learningColor,
        title: AppStrings.learningColors,
        onTap: () {},
      ),
    ];
  }

  Widget _buildGameItem({
    required BuildContext context,
    required String image,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 240,
            width: 240,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Gloock",
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}