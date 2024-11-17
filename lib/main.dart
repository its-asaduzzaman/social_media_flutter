import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/auth/auth.dart';
import 'package:social_media_flutter/firebase_options.dart';
import 'package:social_media_flutter/pages/home_page.dart';
import 'package:social_media_flutter/pages/profile_page.dart';
import 'package:social_media_flutter/pages/user_page.dart';
import 'package:social_media_flutter/theme/dark_mode.dart';
import 'package:social_media_flutter/theme/light_mode.dart';
import 'auth/login_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegisterPage(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/user_page': (context) => const UserPage(),
      },
    );
  }
}
