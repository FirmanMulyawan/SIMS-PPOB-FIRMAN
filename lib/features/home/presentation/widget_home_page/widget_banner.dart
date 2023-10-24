import 'package:flutter/material.dart';

import '../../../../../../components/config/app_style.dart';

class WidgetBanner extends StatelessWidget {
  final String? name;
  final String? image;
  final String? description;

  const WidgetBanner({Key? key, this.name, this.image, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 10;

    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.white,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: AppStyle.grayMain,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 100,
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius)),
                  child: Image.network('$image', fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  name ?? '-',
                  style: MontserratFont.style14SemiBold(
                      textColor: AppStyle.blackCustom),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                description ?? '-',
                style: MontserratFont.style12SemiBold(
                    textColor: AppStyle.blackCustom),
              ),
            )
          ],
        ),
      ),
    );
  }
}
