import 'package:flutter/material.dart';

import '../../../../components/widget/app_shimmer.dart';

class BalanceShimmer extends StatelessWidget {
  const BalanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 180,
      ),
    );
  }
}
