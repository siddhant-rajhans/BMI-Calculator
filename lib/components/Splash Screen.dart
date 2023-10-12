
import 'package:bmi_calculator/main.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class SpLash extends StatefulWidget {
  const SpLash({super.key});

  @override
  State<SpLash> createState() => _SpLashState();
}

class _SpLashState extends State<SpLash> {

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 2)  , () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainApp(), ) );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/images/splash.jpg', fit: BoxFit.contain, ),

      ),

    );
  }
}


