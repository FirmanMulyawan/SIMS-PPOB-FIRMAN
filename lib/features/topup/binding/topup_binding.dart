import 'package:get/get.dart';

import '../presentation/topup_controller.dart';

class TopUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopUpController());
  }
}
