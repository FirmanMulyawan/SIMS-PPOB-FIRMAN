import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_style.dart';
import './text_form_disable.dart';

class CardSaldoHome extends StatelessWidget {
  final String? title;
  final String assetIcon;
  final VoidCallback onTap;
  final bool readOnly;
  final bool obscureText;

  final TextEditingController? controller;

  const CardSaldoHome(
      {Key? key,
      this.title,
      required this.assetIcon,
      required this.onTap,
      this.controller,
      required this.obscureText,
      required this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
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
            height: 20,
          ),
          WidgetTextFormFieldDisable(
            controller: controller,
            obscureText: obscureText,
            readOnly: readOnly,
          ),
          Row(
            children: [
              Text('Lihat Saldo',
                  style: MontserratFont.style14SemiBold(
                      textColor: AppStyle.lightGrey03)),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 30,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(10.0),
                  child: SvgPicture.asset(
                    assetIcon,
                    width: 20,
                    height: 20,
                    fit: BoxFit.scaleDown,
                    // ignore: deprecated_member_use
                    color: AppStyle.lightGrey03,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
