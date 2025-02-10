import 'package:flutter/material.dart';
import 'package:funcolor/resourse/style_manager.dart';
import 'package:funcolor/resourse/values_manager.dart';

import 'color.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      //card theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),

      //app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.lightPrimary,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      //button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary),

      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s17),
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      //text theme
      textTheme: TextTheme(
          displayLarge:
              getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
          headlineLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          headlineMedium: getRegularStyle(color: ColorManager.darkGrey,
          fontSize: FontSize.s14),
          titleMedium: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          bodyLarge: getRegularStyle(color: ColorManager.grey1),
          bodySmall: getRegularStyle(color: ColorManager.grey)),

      //input decoretion
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppPadding.p8),
          hintStyle:
              getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
          labelStyle:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))));
}
