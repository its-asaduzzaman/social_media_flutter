import 'package:flutter/material.dart';
import 'package:social_media_flutter/theme/dark_mode.dart';
import 'package:social_media_flutter/theme/light_mode.dart';

import 'auth/login_or_register.dart';

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
      home: const LoginOrRegisterPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
