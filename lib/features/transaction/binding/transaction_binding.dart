import 'package:get/get.dart';

import '../presentation/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController(Get.find(), Get.find()),
        fenix: true);
  }
}
