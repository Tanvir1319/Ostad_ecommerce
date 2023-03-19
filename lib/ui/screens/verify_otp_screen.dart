import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_ecommerce/ui/screens/complete_profile_screen.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/AppElevatedButton.dart';
import 'package:ostad_ecommerce/ui/widgets/appTextFieldWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
                  'Please Give Your OTP here',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'A 4 digits number is sent to your email',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFa6a6a6),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 16,),
                PinCodeTextField(
                  appContext: context,
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          pinTheme: PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(8),
    fieldHeight: 50,
    fieldWidth: 40,
    activeFillColor: Colors.white,
    inactiveFillColor: Colors.white,
    selectedFillColor: Colors.white,
    selectedColor: AppColors.primaryColor,
  ),
  animationDuration: Duration(milliseconds: 300),
  backgroundColor: Colors.transparent,
  enableActiveFill: true,
  
  onCompleted: (v) {
    print("Completed");
  },
  onChanged: (value) {
    
    
  },
  beforeTextPaste: (text) {
   
    return true;
  },
),
                
                SizedBox(
                  height: 25,
                ),
                AppElevatedButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfileScreen()));
                  },
                  text: 'Go',
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(text: TextSpan(
                  text: 'This code will be expired in',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: ' 120s',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    
                  ]

                ),
                ),
                SizedBox(
                      height: 16,
                    ),
                TextButton(
                  onPressed: (){},
                   child: Text("Resend Code"),
                   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}