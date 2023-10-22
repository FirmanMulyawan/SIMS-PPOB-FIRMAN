import 'package:flutter/material.dart';

import '../config/app_style.dart';

class WidgetTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool? readOnly;
  final Color? focusedBorder;
  final Color? enabledBorder;
  final Color? errorBorderColor;
  final Color? textStyleColor;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String? errorText;
  final bool? enableInteractiveSelection;
  final int? errorMaxLines;
  final bool? isEnable;
  final Function(String)? onChanged;
  final String? initialValue;

  const WidgetTextFormField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.hintText,
      this.textInputAction,
      this.prefixIcon,
      this.controller,
      this.readOnly = false,
      this.focusedBorder = AppStyle.blackCustom,
      this.enabledBorder = AppStyle.lightGrey,
      this.errorBorderColor,
      this.textStyleColor,
      this.suffixIcon,
      this.onTap,
      this.onFieldSubmitted,
      this.obscureText = false,
      this.errorText,
      this.enableInteractiveSelection = false,
      this.errorMaxLines,
      this.isEnable = true,
      this.onChanged,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enableInteractiveSelection: enableInteractiveSelection,
      onTap: onTap,
      readOnly: readOnly ?? false,
      cursorColor: AppStyle.blackCustom,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: OpenSansFont.style14(
          textColor: textStyleColor ?? AppStyle.blackCustom),
      textAlignVertical: TextAlignVertical.center,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      // validator: (value) {},
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: isEnable! ? AppStyle.white : AppStyle.lightGrey02Disable,
        prefixIcon: prefixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: focusedBorder ?? AppStyle.blackCustom, width: 1.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: enabledBorder ?? AppStyle.lightGrey, width: 1.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: OpenSansFont.style14(textColor: AppStyle.lightGrey02),
        errorText: errorText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: errorBorderColor ?? AppStyle.red500, width: 1.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: errorBorderColor ?? AppStyle.red500, width: 1.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorMaxLines: errorMaxLines,
        errorStyle: OpenSansFont.style12SemiBold(textColor: AppStyle.red),
        suffixIcon: suffixIcon,
      ),
      textInputAction: textInputAction,
    );
  }
}
