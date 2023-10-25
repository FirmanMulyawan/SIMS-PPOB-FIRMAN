import 'package:flutter/material.dart';

import '../config/app_style.dart';
import '../config/app_const.dart';

Widget emptyWidget({required VoidCallback onRefresh}) {
  return LayoutBuilder(builder: (context, constraints) {
    return RefreshIndicator(
      onRefresh: () async => Future<void>.delayed(const Duration(seconds: 1))
          .then((value) => onRefresh()),
      color: AppStyle.white,
      backgroundColor: AppStyle.red500,
      strokeWidth: 4.0,
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppConst.assetsImageNF,
                  width: MediaQuery.of(context).size.width / 3,
                  height: 160,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                  'sorry,\nData not found',
                  textAlign: TextAlign.center,
                  style:
                      MontserratFont.style16Bold(textColor: AppStyle.lightGrey),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )),
    );
  });
}
