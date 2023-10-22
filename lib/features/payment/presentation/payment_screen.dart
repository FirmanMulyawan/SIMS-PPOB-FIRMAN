import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/card_saldo.dart';
import '../../../components/widget/text_form_widget.dart';
import '../../../components/widget/custom_button.dart';
import './payment_controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined,
                    color: AppStyle.black),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'PemBayaran',
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
                  Text('PemBayaran',
                      style: MontserratFont.style14SemiBold(
                          textColor: AppStyle.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(AppConst.assetsListrik,
                          width: 30, height: 30, fit: BoxFit.fill),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Listrik Prabayar',
                          style: MontserratFont.style18SemiBold(
                              textColor: AppStyle.black)),
                    ],
                  ),
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
                  const SizedBox(
                    height: 150,
                  ),
                  CustomButton(
                    onTap: () {},
                    name: 'Bayar',
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
