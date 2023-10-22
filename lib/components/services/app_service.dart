import 'package:get/get.dart';

import '../util/storage_util.dart';

class AppService extends GetxService {
  // ignore: unused_field
  final StorageUtil _storage;
  String? deviceId;

  AppService(this._storage);
}
