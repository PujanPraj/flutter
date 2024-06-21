import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/controllers/home_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            elevation: 0,
            backgroundColor: primaryColor,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.music_note,
                  color: Colors.white,
                ),
                label: "Music",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.play_arrow,
              //     color: Colors.white,
              //   ),
              //   label: "PlayList",
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.man,
                  color: Colors.white,
                ),
                label: "Profile",
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: textColor,
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}
