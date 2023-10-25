import 'package:get/get.dart';

import '../presentation/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()), fenix: true);
  }
}
