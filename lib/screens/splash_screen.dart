import 'package:flutter/material.dart';

import '../components/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenTimer() {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/login'));
  }

  @override
  void initState() {
    splashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1F319D),
      body: AppLogo(
        color: Color(0xFFEEEDF3),
      ),
    );
  }
}
