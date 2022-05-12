import 'package:capstone_project_practice/screens/cart.dart';
import 'package:capstone_project_practice/screens/home.dart';
import 'package:capstone_project_practice/screens/signup_screen.dart';
import 'package:capstone_project_practice/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            headline1: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 32,
              color: Color(0xFFEEEDF3),
              fontFamily: 'Gobold',
            ),
            bodyText1: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF1B1B1D),
              fontFamily: 'Gotham',
            ),
            bodyText2: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: const Color(0xFF1B1B1D).withOpacity(0.5),
              fontFamily: 'Gotham',
            )),
        scaffoldBackgroundColor: const Color(0xFFE8E8E8),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            elevation: 0,
            color: Colors.transparent,
            centerTitle: true),
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const Home(),
        '/cart': (context) => const Cart()
      },
    );
  }
}
