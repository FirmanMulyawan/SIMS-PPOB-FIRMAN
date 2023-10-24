import 'package:get/get.dart';

import '../../../components/config/app_route.dart';
import '../../../components/util/storage_util.dart';

class SplashController extends GetxController {
  final StorageUtil _storageUtil;
  bool isLoggedIn = false;

  SplashController(this._storageUtil);

  @override
  void onInit() {
    refreshUserLoggedIn();
    super.onInit();
  }

  Future refreshUserLoggedIn() async {
    final token = await _storageUtil.getUserToken();
    isLoggedIn = token != null;
    update();
    _refreshUserLoggedIn();
  }

  _refreshUserLoggedIn() {
    if (isLoggedIn == false) {
      toLogin();
    } else {
      toHomeScreen();
    }
  }

  void toHomeScreen() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Get.offNamedUntil(AppRoute.homeNavigationScreen, (route) => false));
  }

  void toLogin() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamed(AppRoute.login));
  }
}
