import 'package:get/get.dart';

import '../presentation/my_favorite_controller.dart';

class MyFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyFavoriteController(Get.find()), fenix: true);
  }
}
