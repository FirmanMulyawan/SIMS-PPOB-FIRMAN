import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/card_saldo_home.dart';
import '../../../components/widget/title_home.dart';

import './home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: const TitleHome()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CardSaldoHome(
                    obscureText: ctrl.isObscureText,
                    readOnly: false,
                    onTap: () {
                      ctrl.isObscureText == true
                          ? ctrl.updateIsObscureText(false)
                          : ctrl.updateIsObscureText(true);
                    },
                    assetIcon: ctrl.isObscureText == true
                        ? AppConst.assetEyeVisibilityOff
                        : AppConst.assetEyeVisibility,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Tentukan promo menarik',
                      style: MontserratFont.style14SemiBold(
                          textColor: AppStyle.black)),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
