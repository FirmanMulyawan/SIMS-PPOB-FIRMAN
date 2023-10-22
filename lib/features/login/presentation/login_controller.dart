import 'package:get/get.dart';

import '../../../components/config/app_route.dart';

class LoginController extends GetxController {
  bool isPassword = true;

  LoginController();

  @override
  void onInit() {
    // toHomeScreen();
    super.onInit();
  }

  void updateIsPassword(bool? value) {
    isPassword = value!;
    update();
  }

  void toHomeScreen() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Get.offNamedUntil(AppRoute.homeNavigationScreen, (route) => false));
  }
}
