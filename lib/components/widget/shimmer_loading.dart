import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../config/app_style.dart';

class ShimmerLoading extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? baseColor;
  final Color? highlightColor;
  final double? borderRadius;

  const ShimmerLoading({Key? key, this.height = 25, this.width = double.infinity, this.baseColor = AppStyle.gray700, this.highlightColor = AppStyle.grey100, this.borderRadius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor!,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: Colors.white,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
