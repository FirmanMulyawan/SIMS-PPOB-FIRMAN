import 'package:get/get.dart';

import '../../../components/util/network.dart';
import '../presentation/home_controller.dart';

import '../repository/home_repository.dart';
import '../repository/home_datasource.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.lazyPut(() => HomeDataSource(Network.dioClient()));
  }
}
