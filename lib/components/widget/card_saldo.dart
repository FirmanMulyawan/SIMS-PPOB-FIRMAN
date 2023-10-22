import 'package:flutter/material.dart';
import '../config/app_style.dart';

class CardSaldo extends StatelessWidget {
  final String? title;
  final String saldo;

  const CardSaldo({Key? key, this.title, required this.saldo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppStyle.red500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? 'Saldo anda',
              style: MontserratFont.style14SemiBold(
                  textColor: AppStyle.lightGrey03)),
          const SizedBox(
            height: 50,
          ),
          Text('Rp $saldo',
              style: MontserratFont.style28SemiBold(textColor: AppStyle.white)),
        ],
      ),
    );
  }
}
