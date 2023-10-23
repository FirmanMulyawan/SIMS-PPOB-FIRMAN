import 'package:get/get.dart';

import '../presentation/register_controller.dart';
import '../repository/register_repository.dart';
import '../repository/register_datasource.dart';

import '../../../components/util/network.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find()), fenix: true);
    Get.lazyPut(() => RegisterDataSource(Network.dioClient()));
    Get.lazyPut(() => RegisterRepository(Get.find()));
  }
}
