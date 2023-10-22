import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/util/storage_util.dart';
import '../../my_favorite/presentation/my_favorite_screen.dart';
import '../../home/presentation/home_screen.dart';

class HomeNavigationController extends GetxController {
  HomeNavigationController({
    required this.storageUtil,
  }) : super();

  var selectedItem = 0.obs;
  final StorageUtil storageUtil;

  List<Widget> widgetList = <Widget>[
    const HomeScreen(),
    const MyFavoriteScreen(),
  ];

  @override
  void onInit() async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(0);
    if (Get.arguments != null) {
      if (Get.arguments == "navigateToTransactionHistoryScreen") {
        navigationToTransactionHistoryScreen();
      } else if (Get.arguments ==
          "navigateToTransactionFinishedHistoryScreen") {
        navigationToTransactionHistoryScreen();
      } else if (Get.arguments == "navigateToOrderTransactionScreen") {
        navigationToOrderTransactionScreen();
      }
    }
    super.onInit();
  }

  void onItemTapped(int value, BuildContext? context) async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(value);
    selectedItem.value = value;
  }

  void navigationToTransactionHistoryScreen() async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(1);
    selectedItem.value = 1;
  }

  void navigationToOrderTransactionScreen() async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(2);
    selectedItem.value = 2;
  }
}
