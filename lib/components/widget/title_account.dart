import 'package:flutter/material.dart';
import '../config/app_style.dart';

class TitleAkun extends StatelessWidget {
  final String title;

  const TitleAkun({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: MontserratFont.style14SemiBold(textColor: AppStyle.black),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
