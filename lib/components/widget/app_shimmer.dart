import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../config/app_style.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmer({
    required this.child,
    this.baseColor,
    this.highlightColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppStyle.lightGrey,
      highlightColor: highlightColor ?? AppStyle.lightGrey,
      period: const Duration(
        milliseconds: 1000,
      ),
      child: child,
    );
  }
}
