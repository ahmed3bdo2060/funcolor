
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';
import 'gradient_box_border.dart';


class GameStyles {
  
  static BoxDecoration gameContainerDecoration = BoxDecoration(
    color: AppColors.cWhiteColor,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(180),
    border: GradientBoxBorder(
      gradient: LinearGradient(
        colors: [AppColors.borderColor, AppColors.borderColor2],
      ),
      width: 5,
    ),
  );
}
