import 'package:get/get.dart';

import '../../../components/config/app_route.dart';

class RegisterController extends GetxController {
  bool isPassword = true;

  RegisterController();

  @override
  void onInit() {
    // toHomeScreen();
    super.onInit();
  }

  void updateIsPassword(bool? value) {
    isPassword = value!;
    update();
  }

  void toLoginScreen() {
    Get.toNamed(AppRoute.login);
  }
}
