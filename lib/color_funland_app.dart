
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/constants/app_theme.dart';
import 'core/constants/routes.dart';


class ColorFunLandApp extends StatelessWidget {
  const ColorFunLandApp({super.key});

  @override
  Widget build(BuildContext context) {
   

    return ScreenUtilInit(
        designSize:
            const Size(1280, 800), 
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: lightTheme,
            routes: routes,
          );
        });
  }
}
