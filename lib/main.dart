
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funcolor/core/constants/app_theme.dart';
import 'package:user_repository/user_repository.dart';
import 'app.dart';
import 'app_2.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/routes.dart';
import 'features/game_board/presentation/pages/game_board_screen.dart';
import 'modules/firebase/firebase_config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.initialize();
  runApp( MyApp());
}


