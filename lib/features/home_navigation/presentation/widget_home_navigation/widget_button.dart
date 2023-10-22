import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetButton extends StatelessWidget {
  final Color colorIcon;
  final VoidCallback onTap;
  final String nameAsset;
  final String buttonName;
  final TextStyle styletext;

  const WidgetButton({
    Key? key,
    required this.colorIcon,
    required this.onTap,
    required this.nameAsset,
    required this.buttonName,
    required this.styletext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onTap,
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: SvgPicture.asset(nameAsset,
                  width: 25,
                  height: 25,
                  // ignore: deprecated_member_use
                  color: colorIcon),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(buttonName, textAlign: TextAlign.center, style: styletext),
      ),
    ]);
  }
}
