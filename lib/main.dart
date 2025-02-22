
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funcolor/core/constants/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/routes.dart';
import 'features/game_board/presentation/pages/game_board_screen.dart';
import 'modules/firebase/firebase_config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
