import 'package:flutter/material.dart';

import '../../../../components/config/app_style.dart';

class CardTransaction extends StatelessWidget {
  final String? saldo;
  final String? date;
  final String? description;

  const CardTransaction({Key? key, this.saldo, this.date, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+ Rp. $saldo',
                    style:
                        MontserratFont.style18SemiBold(textColor: AppStyle.red),
                  ),
                  Text(
                    date ?? '-',
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
                  Text(description ?? '',
                      style: MontserratFont.style14SemiBold(
                          textColor: AppStyle.lightGrey02)),
                ],
              )),
            ],
          ),
        ));
  }
}
