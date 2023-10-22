import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/my_favorite_binding.dart';
// import 'presentation/detail_team_screen.dart';
import './presentation/my_favorite_screen.dart';

class MyFavoriteRoute {
  static const String myFavoriteScreen = '/myFavoriteScreen';

  static List<GetPage> pages = [
    GetPage(
        name: myFavoriteScreen,
        page: () => const MyFavoriteScreen(),
        binding: MyFavoriteBinding()),
  ];
}
