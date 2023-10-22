import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/card_saldo.dart';
import '../../../components/widget/text_form_widget.dart';
import '../../../components/widget/custom_button.dart';
import './topup_controller.dart';

class TopUpScreen extends GetView<TopUpController> {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopUpController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Text(
                'Top Up',
                style:
                    MontserratFont.style16SemiBold(textColor: AppStyle.black),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CardSaldo(
                    saldo: '20.000',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text('Silahkan masukan',
                      style: MontserratFont.style14SemiBold(
                          textColor: AppStyle.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('nominal Top Up',
                      style: MontserratFont.style18SemiBold(
                          textColor: AppStyle.black)),
                  const SizedBox(
                    height: 50,
                  ),
                  WidgetTextFormField(
                    enableInteractiveSelection: false,
                    hintText: 'masukkan nominal Top Up',
                    textInputAction: TextInputAction.next,
                    errorText: null,
                    obscureText: true,
                    prefixIcon: SizedBox(
                      height: 30,
                      child: SvgPicture.asset(
                        AppConst.assetMoney,
                        width: 16,
                        height: 16,
                        fit: BoxFit.scaleDown,
                        // ignore: deprecated_member_use
                        color: AppStyle.lightGrey02,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: AppStyle.lightGrey, width: 1.1)),
                    child: Center(
                      child: Text('hello',
                          style: MontserratFont.style18SemiBold(
                              textColor: AppStyle.grayMain)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    onTap: () => ctrl.toPaymentScreen(),
                    name: 'Top Up',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
