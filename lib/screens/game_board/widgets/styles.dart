import 'package:flutter/material.dart';
import 'package:funcolor/resourse/color.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GameStyles {
  static const TextStyle bubleStyle = TextStyle(
    fontFamily: "Buble",
    color: Color(0xff7E32F8),
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle minnieStyle = TextStyle(
    fontFamily: "Gloock",
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static const TextStyle gameNameStyle = TextStyle(
    fontFamily: "Gloock",
    fontWeight: FontWeight.w400,
    fontSize: 24,
  );

  static const TextStyle dividerStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );

  static BoxDecoration gameContainerDecoration = BoxDecoration(
    color: ColorManager.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(180),
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: [ColorManager.borderColor, ColorManager.borderColor2],
      ),
      width: 5,
    ),
  );
}
