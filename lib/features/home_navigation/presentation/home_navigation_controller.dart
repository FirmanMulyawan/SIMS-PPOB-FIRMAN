import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/util/storage_util.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../transaction/presentation/transaction_screen.dart';
import '../../topup/presentation/topup_screen.dart';

class HomeNavigationController extends GetxController {
  HomeNavigationController({
    required this.storageUtil,
  }) : super();

  var selectedItem = 0.obs;
  final StorageUtil storageUtil;

  List<Widget> widgetList = <Widget>[
    const HomeScreen(),
    const TopUpScreen(),
    const TransactionScreen(),
    const ProfileScreen(),
  ];

  @override
  void onInit() async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(0);
    super.onInit();
  }

  void onItemTapped(int value, BuildContext? context) async {
    await storageUtil.setCurrentSelectedMenuBottomNavigation(value);
    selectedItem.value = value;
  }
}
