import 'package:flutter/material.dart';

import '../../../../components/widget/app_shimmer.dart';

class BalanceShimmer extends StatelessWidget {
  final double? height;

  const BalanceShimmer({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: height,
      ),
    );
  }
}
