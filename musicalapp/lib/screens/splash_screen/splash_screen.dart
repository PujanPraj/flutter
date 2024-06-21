import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/images.dart';
import 'package:musicalapp/constants/text_style.dart';
import 'package:musicalapp/screens/auth_screen/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
// Delay for 3 seconds and then navigate to the LoginScreen
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(LoginScreen());
    });

    return Scaffold(
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconLogo),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "VRENSO",
                style: ourStyle(color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
