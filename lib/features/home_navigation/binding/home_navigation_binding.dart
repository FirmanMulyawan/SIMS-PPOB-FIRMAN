import 'package:get/get.dart';
import '../presentation/home_navigation_controller.dart';

import '../../home/presentation/home_controller.dart';
import '../../home/repository/home_repository.dart';
import '../../my_favorite/presentation/my_favorite_controller.dart';
import '../../home/repository/home_datasource.dart';

import '../../../components/util/network.dart';

class HomeNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeNavigationController(storageUtil: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.lazyPut(() => MyFavoriteController(Get.find()), fenix: true);
    Get.lazyPut(() => HomeDataSource(Network.dioClient()));
  }
}
