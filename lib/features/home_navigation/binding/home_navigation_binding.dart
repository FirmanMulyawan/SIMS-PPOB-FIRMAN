import 'package:get/get.dart';
import '../presentation/home_navigation_controller.dart';
import '../../profile/presentation/profile_controller.dart';
import '../../transaction/presentation/transaction_controller.dart';
import '../../topup/presentation/topup_controller.dart';
import '../../home/presentation/home_controller.dart';

class HomeNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNavigationController(storageUtil: Get.find()));
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => TransactionController());
    Get.lazyPut(() => TopUpController());

//
    Get.lazyPut(() => HomeController());
  }
}
