import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'home_navigation_controller.dart';
import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import './widget_home_navigation/widget_button.dart';

class HomeNavigationScreen extends GetView<HomeNavigationController> {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Obx(() => SafeArea(
            bottom: false,
            child: IndexedStack(
              index: controller.selectedItem.value,
              children: controller.widgetList,
            ),
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppStyle.blackCustom,
              blurRadius: 2,
            ),
          ],
        ),
        child: BottomAppBar(
          notchMargin: 10,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 19),
            child: Obx(() => Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: WidgetButton(
                        buttonName: 'Home',
                        nameAsset: AppConst.assetHome,
                        onTap: () => controller.onItemTapped(0, context),
                        styletext: _currentStyleText(
                            controller.selectedItem.value, 0)!,
                        colorIcon:
                            _currentColor(controller.selectedItem.value, 0)!,
                      ),
                    ),
                    Expanded(
                      child: WidgetButton(
                        buttonName: 'Top UP',
                        nameAsset: AppConst.assetMoney,
                        onTap: () => controller.onItemTapped(1, context),
                        styletext: _currentStyleText(
                            controller.selectedItem.value, 1)!,
                        colorIcon:
                            _currentColor(controller.selectedItem.value, 1)!,
                      ),
                    ),
                    Expanded(
                      child: WidgetButton(
                        buttonName: 'Transaction',
                        nameAsset: AppConst.assetCardATM,
                        onTap: () => controller.onItemTapped(2, context),
                        styletext: _currentStyleText(
                            controller.selectedItem.value, 2)!,
                        colorIcon:
                            _currentColor(controller.selectedItem.value, 2)!,
                      ),
                    ),
                    Expanded(
                      child: WidgetButton(
                        buttonName: 'Akun',
                        nameAsset: AppConst.assetUserDashboard,
                        onTap: () => controller.onItemTapped(3, context),
                        styletext: _currentStyleText(
                            controller.selectedItem.value, 3)!,
                        colorIcon:
                            _currentColor(controller.selectedItem.value, 3)!,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
    return HomeNavigationScreenData(
      homeNavigationController: controller,
      child: content,
    );
  }

  Color? _currentColor(int selectedItem, int value) {
    if (selectedItem == value) {
      return AppStyle.black;
    } else {
      return AppStyle.lightGrey02;
    }
  }

  TextStyle? _currentStyleText(int selectedItem, int value) {
    if (selectedItem == value) {
      return MontserratFont.style12SemiBold(textColor: AppStyle.black);
    } else {
      return MontserratFont.style12(textColor: AppStyle.lightGrey02);
    }
  }
}

class HomeNavigationScreenData extends InheritedWidget {
  final HomeNavigationController homeNavigationController;

  const HomeNavigationScreenData({
    super.key,
    required this.homeNavigationController,
    required super.child,
  });

  static HomeNavigationScreenData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeNavigationScreenData>();
  }

  @override
  bool updateShouldNotify(covariant HomeNavigationScreenData oldWidget) {
    return homeNavigationController != oldWidget.homeNavigationController;
  }
}
