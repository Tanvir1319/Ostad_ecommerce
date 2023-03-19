import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_ecommerce/ui/screens/verify_otp_screen.dart';
import 'package:ostad_ecommerce/ui/widgets/AppElevatedButton.dart';
import 'package:ostad_ecommerce/ui/widgets/AppTextFieldWidget.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                ),
                SvgPicture.asset(
                  'assets/images/craftyBay.svg',
                  width: 150,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Please enter your email address here',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFa6a6a6),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Give your email here',
                ),
                SizedBox(
                  height: 25,
                ),
                AppElevatedButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpScreen()));
                  },
                  text: 'Go',
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
