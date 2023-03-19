import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/ui/screens/category_screen.dart';
import 'package:ostad_ecommerce/ui/screens/emailAuthScreen.dart';
import 'package:ostad_ecommerce/ui/screens/home_screen.dart';
import 'package:ostad_ecommerce/ui/screens/splash_screen.dart';

void main() {
  runApp(const CraftyBayApp());
}

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ostad Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
