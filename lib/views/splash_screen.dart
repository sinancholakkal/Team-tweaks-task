import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void>splashing()async{
    final prefs = await SharedPreferences.getInstance();
  final savedEmail = prefs.getString('email');
    await Future.delayed(Duration(seconds: 2));
    log(savedEmail.toString());
    if(savedEmail !=null){

      context.go("/home");
    }else{
      context.go("/login");
    }
  }
  @override
  void initState() {
    splashing();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: Lottie.asset("asset/Animation - 1725032034100.json")),
      ),
    );
  }
}