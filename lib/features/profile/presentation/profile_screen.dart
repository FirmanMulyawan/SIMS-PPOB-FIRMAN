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
                        controller: ctrl.emailCtr,
                        readOnly: true,
                        focusedBorder: AppStyle.lightGrey,
                        errorText: ctrl.errorEmail,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        hintText: 'masukkan email anda',
                        textInputAction: TextInputAction.next,
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
                        controller: ctrl.firstNameCtr,
                        readOnly: ctrl.readOnly,
                        focusedBorder: ctrl.readOnly
                            ? AppStyle.lightGrey
                            : AppStyle.blackCustom,
                        hintText: 'masukkan nama depan',
                        textInputAction: TextInputAction.next,
                        errorText: ctrl.errorFirstName,
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
                        controller: ctrl.lastNameCtr,
                        readOnly: ctrl.readOnly,
                        focusedBorder: ctrl.readOnly
                            ? AppStyle.lightGrey
                            : AppStyle.blackCustom,
                        errorText: ctrl.errorLastName,
                        hintText: 'masukkan nama belakang',
                        textInputAction: TextInputAction.done,
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
                      if (ctrl.readOnly == true) ...[
                        CustomButton(
                          onTap: () => ctrl.updateReadOnly(false),
                          backgroundColor: AppStyle.white,
                          sideColor: AppStyle.appTheme,
                          name: 'Edit Profile',
                          textColor: AppStyle.appTheme,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:
                                  const Text('Apakah anda yakin akan keluar?'),
                              actionsPadding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppStyle.lightGrey02,
                                    foregroundColor: AppStyle.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  onPressed: () => Get.back(),
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppStyle.red500,
                                    foregroundColor: AppStyle.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                  onPressed: () => ctrl.onLogoutClick(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                          name: 'Logout',
                        ),
                      ] else ...[
                        CustomButton(
                          onTap: () =>
                              ctrl.onPressEditProfile(context: context),
                          name: 'Simpan',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onTap: () => ctrl.cancelEditProfile(true),
                          backgroundColor: AppStyle.white,
                          sideColor: AppStyle.appTheme,
                          name: 'Batalkan',
                          textColor: AppStyle.appTheme,
                        ),
                      ],
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
                            ctrl.nameCtr.text,
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
