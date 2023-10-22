import 'package:flutter/material.dart';

import '../config/app_const.dart';
import '../config/app_style.dart';

class EmptyData extends StatelessWidget {
  final double? width;

  const EmptyData({Key? key, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppConst.assetsImageNF,
                  width: width,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'sorry,\nData not found',
                  textAlign: TextAlign.center,
                  style: MontserratFont.style18Bold(
                      textColor: const Color(0xFF333333)),
                ),
                const SizedBox(
                  height: 9,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
