import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/config/app_style.dart';
import '../../../components/widget/title_account.dart';
import '../../../components/widget/card_saldo.dart';
import './transaction_controller.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Text(
                'Transaksi',
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
                    saldo: '34.0000',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TitleAkun(
                    title: 'Transaksi',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+ Rp. 100.000',
                                  style: MontserratFont.style18SemiBold(
                                      textColor: AppStyle.red),
                                ),
                                Text(
                                  '17 Agustus 2023 13:10 WIB',
                                  style: MontserratFont.style14SemiBold(
                                      textColor: AppStyle.gray700),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Top Up Saldo',
                                    style: MontserratFont.style14SemiBold(
                                        textColor: AppStyle.lightGrey02)),
                              ],
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
