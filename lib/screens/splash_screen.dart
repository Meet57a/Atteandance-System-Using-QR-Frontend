import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/constants/session.dart';
import 'package:frontend/screens/home_page.dart';
import 'package:frontend/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  @override
  void initState() {
    sessionCheck();
    goToLogin();
    super.initState();
  }

  void sessionCheck() async {
    final prefs = await SharedPreferences.getInstance();
    SessionHandler.isLoginMeth(prefs);
    isLogin = SessionHandler.isLogin;
  }

  goToLogin() async {
    Timer(
      const Duration(seconds: 2),
      () => (isLogin == true)
          ?
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            )
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(30, 39, 46, 1.0),
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
