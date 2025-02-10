
import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/resourse/routes_manager.dart';
import 'package:funcolor/screens/game_board/screen1.dart';
import 'package:funcolor/screens/my_painting/my_painting.dart';
import 'package:funcolor/screens/my_painting/pages/animal_page.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:GameBoard(),
      routes:RoutesGenerator
    );
  }
}
