import 'package:flutter/material.dart';
import '../config/app_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final bool? isButtonDisable;
  final Color? backgroundColor;
  final Color? sideColor;
  final Color? textColor;
  final double? paddingHorizontal;
  final double? borderRadius;

  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.name,
      this.isButtonDisable,
      this.sideColor,
      this.textColor,
      this.backgroundColor,
      this.paddingHorizontal,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isButtonDisable == true ? null : onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10))),
          side: MaterialStateProperty.all(
              BorderSide(width: 1, color: sideColor ?? Colors.transparent)),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? AppStyle.red500),
          fixedSize: MaterialStateProperty.all(const Size(240, 50)),
        ),
        child: Text(
          name,
          style: MontserratFont.style16SemiBold(
              textColor: textColor ?? AppStyle.white),
        ),
      ),
    );
  }
}
