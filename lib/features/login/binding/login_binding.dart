import 'package:get/get.dart';

import '../presentation/login_controller.dart';
import '../repository/login_datasource.dart';
import '../repository/login_repository.dart';

import '../../../components/util/network.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => LoginDataSource(Network.dioClient()));
    Get.lazyPut(() => LoginRepository(Get.find()));
  }
}
