import 'package:get/get.dart';

import '../../../components/config/app_route.dart';

class TopUpController extends GetxController {
  TopUpController();

  void toPaymentScreen() {
    Get.toNamed(AppRoute.paymentScreen);
  }
}
