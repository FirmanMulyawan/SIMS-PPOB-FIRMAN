import 'package:get/get.dart';
import '../../../components/util/network.dart';
import '../../transaction/repository/transaction_datasource.dart';
import '../../transaction/repository/transaction_repository.dart';
import '../presentation/home_navigation_controller.dart';
import '../../profile/presentation/profile_controller.dart';
import '../../transaction/presentation/transaction_controller.dart';
import '../../topup/presentation/topup_controller.dart';
import '../../home/presentation/home_controller.dart';
import '../../home/repository/home_repository.dart';
import '../../home/repository/home_datasource.dart';

class HomeNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNavigationController(storageUtil: Get.find()));
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => TopUpController());

    Get.lazyPut(() => TransactionController(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut(() => TransactionRepository(Get.find()));
    Get.lazyPut(() => TransactionDataSource(Network.dioClient()));

    Get.lazyPut(() => HomeController(Get.find()), fenix: true);
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.lazyPut(() => HomeSource(Network.dioClient()));
  }
}
