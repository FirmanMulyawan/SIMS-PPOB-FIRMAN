import 'package:flutter/material.dart';

import '../config/app_style.dart';

class WidgetTextFormFieldDisable extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? readOnly;
  final Color? textStyleColor;
  final bool obscureText;
  final bool? enableInteractiveSelection;
  final Function(String)? onChanged;
  final String? initialValue;

  const WidgetTextFormFieldDisable(
      {Key? key,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.readOnly = false,
      this.textStyleColor,
      this.obscureText = false,
      this.enableInteractiveSelection = false,
      this.onChanged,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      style: MontserratFont.style28SemiBold(
          textColor: textStyleColor ?? AppStyle.white),
      textAlignVertical: TextAlignVertical.center,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      // validator: (value) {},
      decoration: const InputDecoration(
        filled: true,
        fillColor: AppStyle.red500,
        border: InputBorder.none,
      ),
    );
  }
}
