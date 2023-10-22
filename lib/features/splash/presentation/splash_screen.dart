import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/config/app_const.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppConst.assetsLogo,
                      width: 150, height: 150, fit: BoxFit.fill),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
