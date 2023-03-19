import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_ecommerce/ui/screens/main_bottom_navigation_bar.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
    ).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavigationBar()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/images/craftyBay.svg',
              width: 150,
              fit: BoxFit.scaleDown,
            ),
            Spacer(),
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 6,
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
