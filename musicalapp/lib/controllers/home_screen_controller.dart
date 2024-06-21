import "package:get/get.dart";
import "package:musicalapp/screens/home_screen/home_screen.dart";
import "package:musicalapp/screens/music_screen/music_screen.dart";
import "package:musicalapp/screens/playlist_screen/playlist_screen.dart";
import "package:musicalapp/screens/profile_screen/profile_screen.dart";

class HomeController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const MusicScreen(),
    // const PlayListScreen(),
    const ProfileScreen()
  ];
}
