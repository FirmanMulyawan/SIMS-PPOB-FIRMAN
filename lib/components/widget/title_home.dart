import 'package:flutter/material.dart';
import '../config/app_style.dart';
import '../config/app_const.dart';

class TitleHome extends StatelessWidget {
  final String imageLink;

  const TitleHome({
    Key? key,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset(AppConst.assetsLogo,
                  width: 30, height: 30, fit: BoxFit.fill),
              const SizedBox(
                width: 10,
              ),
              Text(
                'SIMSS PPOB',
                style:
                    MontserratFont.style16SemiBold(textColor: AppStyle.black),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(110),
              color: AppStyle.red,
              border: Border.all(color: AppStyle.lightGrey03, width: 1.1)),
          child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(imageLink)),
        ),
      ],
    );
  }
}
