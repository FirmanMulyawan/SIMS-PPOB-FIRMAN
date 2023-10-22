import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/home_binding.dart';
import 'presentation/home_screen.dart';

class HomeRoute {
  static const String homeScreen = '/homeScreen';

  static List<GetPage> pages = [
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
  ];
}
