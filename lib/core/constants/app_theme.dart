
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funcolor/core/constants/app_strings.dart';
import 'package:funcolor/core/utils/app_colors.dart';

ThemeData? lightTheme = ThemeData(
            fontFamily:AppStrings.primaryFontFamily,
            useMaterial3: true,
            scaffoldBackgroundColor:AppColors. cWhiteColor,
          
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.cWhiteColor,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                 systemNavigationBarColor: Colors.transparent,  
                systemNavigationBarIconBrightness: Brightness.dark, 
              )
            )
          );