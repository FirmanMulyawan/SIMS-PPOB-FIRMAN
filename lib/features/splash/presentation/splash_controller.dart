import 'package:get/get.dart';

import '../../../components/config/app_route.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    toLogin();
    super.onInit();
  }

  void toLogin() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamedUntil(AppRoute.login, (route) => false));
  }
}
