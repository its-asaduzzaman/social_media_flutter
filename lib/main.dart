import 'package:flutter/material.dart';
import 'package:social_media_flutter/pages/home_page.dart';
import 'package:social_media_flutter/pages/login_page.dart';
import 'package:social_media_flutter/pages/register_page.dart';
import 'package:social_media_flutter/theme/dark_mode.dart';
import 'package:social_media_flutter/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RegisterPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
