import 'package:get/get.dart';

import '../presentation/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
