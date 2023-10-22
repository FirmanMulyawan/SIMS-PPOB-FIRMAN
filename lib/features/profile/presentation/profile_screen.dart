import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/text_form_widget.dart';
import '../../../components/widget/custom_button.dart';
import '../../../components/widget/title_account.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Text(
                'Akun',
                style:
                    MontserratFont.style16SemiBold(textColor: AppStyle.black),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 220,
                      ),
                      const TitleAkun(
                        title: 'Email',
                      ),
                      WidgetTextFormField(
                        enableInteractiveSelection: false,
                        hintText: 'masukkan email anda',
                        textInputAction: TextInputAction.next,
                        errorText: null,
                        obscureText: true,
                        prefixIcon: SizedBox(
                          height: 30,
                          child: SvgPicture.asset(
                            AppConst.assetAtSign,
                            width: 16,
                            height: 16,
                            fit: BoxFit.scaleDown,
                            // ignore: deprecated_member_use
                            color: AppStyle.lightGrey02,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleAkun(
                        title: 'Nama Depan',
                      ),
                      WidgetTextFormField(
                        enableInteractiveSelection: false,
                        hintText: 'masukkan nama depan',
                        textInputAction: TextInputAction.done,
                        errorText: null,
                        prefixIcon: SizedBox(
                          height: 30,
                          child: SvgPicture.asset(
                            AppConst.assetUser,
                            width: 16,
                            height: 16,
                            fit: BoxFit.scaleDown,
                            // ignore: deprecated_member_use
                            color: AppStyle.lightGrey02,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleAkun(
                        title: 'Nama Belakang',
                      ),
                      WidgetTextFormField(
                        enableInteractiveSelection: false,
                        hintText: 'masukkan nama belakang',
                        textInputAction: TextInputAction.done,
                        errorText: null,
                        prefixIcon: SizedBox(
                          height: 30,
                          child: SvgPicture.asset(
                            AppConst.assetUser,
                            width: 16,
                            height: 16,
                            fit: BoxFit.scaleDown,
                            // ignore: deprecated_member_use
                            color: AppStyle.lightGrey02,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        onTap: () {},
                        name: 'Simpan',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onTap: () {},
                        backgroundColor: AppStyle.white,
                        sideColor: AppStyle.appTheme,
                        name: 'Batalkan',
                        textColor: AppStyle.appTheme,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(110),
                                color: AppStyle.white,
                                border: Border.all(
                                    color: AppStyle.lightGrey03, width: 1.1)),
                            child: Stack(
                              children: [
                                const CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        'https://www.iconsdb.com/icons/preview/dark-gray/user-xxl.png')),
                                Positioned(
                                  bottom: 7,
                                  right: 0,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(110),
                                        color: AppStyle.white,
                                        border: Border.all(
                                            color: AppStyle.lightGrey03,
                                            width: 1.1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SvgPicture.asset(
                                        height: 26,
                                        width: 26,
                                        AppConst.assetPen,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kristanto Wibowo',
                            style: MontserratFont.style18Bold(
                                textColor: AppStyle.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
