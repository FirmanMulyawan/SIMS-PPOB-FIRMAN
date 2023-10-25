import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/config/app_style.dart';
import '../../../components/widget/title_account.dart';
import '../../../components/widget/card_saldo.dart';
import '../../../components/widget/empty_data.dart';
import '../../home/presentation/widget_home_page/loading_balance.dart';
import './transaction_controller.dart';
import '../transaction_state.dart';

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
                  if (ctrl.transactionBalanceState
                      is TransactionBalanceSuccess) ...[
                    CardSaldo(
                      saldo: ctrl.saldo.text,
                    ),
                  ] else if (ctrl.transactionBalanceState
                      is TransactionBalanceLoading) ...[
                    const BalanceShimmer(
                      height: 150,
                    )
                  ] else ...[
                    const SizedBox()
                  ],
                  const SizedBox(
                    height: 50,
                  ),
                  const TitleAkun(
                    title: 'Transaksi',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _transaction(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _transaction(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
      width: width,
      child: GetBuilder<TransactionController>(builder: (ctrl) {
        final state = ctrl.transactionState;

        if (state is TransactionSuccess) {
          return Container(
            height: 20,
            width: 20,
            color: Colors.amber,
          );
        }

        if (state is TransactionLoading) {
          return const Column(
            children: [
              BalanceShimmer(
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              BalanceShimmer(
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              BalanceShimmer(
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              BalanceShimmer(
                height: 80,
              ),
              SizedBox(
                height: 150,
              ),
            ],
          );
        }

        if (state is TransactionEmpty) {
          return EmptyData(width: width * 0.5);
        }
        return Container();
      }));
  // CardTransaction();
}
