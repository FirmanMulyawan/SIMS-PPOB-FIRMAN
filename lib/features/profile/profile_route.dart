import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/profile_binding.dart';
import 'presentation/profile_screen.dart';

class ProfileRoute {
  static const String profileScreen = '/profileScreen';

  static List<GetPage> pages = [
    GetPage(
        name: profileScreen,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
  ];
}
