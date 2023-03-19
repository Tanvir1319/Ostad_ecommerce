import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_ecommerce/ui/screens/main_bottom_navigation_bar.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/AppElevatedButton.dart';
import 'package:ostad_ecommerce/ui/widgets/AppTextFieldWidget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SafeArea(
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
                 SizedBox(
                  height: 10,
                ),
                Text(
                  'Complete Your Profile Here',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
                Text(
                  'Get Started With Your Details',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFa6a6a6),
                    letterSpacing: 0.5,
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "First Name",
                ),
                 SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Last Name",
                ),
                 SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "City",
                ),
                 SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Mobile",
                ),
                 SizedBox(
                  height: 10,
                ),
                AppTextFieldWidget(
                  controller: TextEditingController(),
                  maxLines: 4,
                  hintText: "Shipping Address",
                ),
                SizedBox(
                  height: 25,
                ),
                AppElevatedButton(
                  onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainBottomNavigationBar(),), (route) => false);
                  },
                  text: 'Complete',
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
