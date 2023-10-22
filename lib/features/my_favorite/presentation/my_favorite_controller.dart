import 'package:get/get.dart';

import '../../home/presentation/home_controller.dart';

import '../../../components/util/storage_util.dart';

class MyFavoriteController extends GetxController {
  final StorageUtil _storageUtil;
  final _homeController = Get.find<HomeController>();
  MyFavoriteController(this._storageUtil);
}
