import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/app_const.dart';
import '../../../components/widget/loading_overlay/loading_screen.dart';
import './register_controller.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/text_form_widget.dart';
import '../../../components/widget/custom_button.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (ctrl) {
        return WillPopScope(
          onWillPop: () async {
            LoadingScreen().hide();
            return true;
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  // keyboardDismissBehavior:
                  //     ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppConst.assetsLogo,
                                width: 30, height: 30, fit: BoxFit.fill),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'SIMS PPOB',
                              style: MontserratFont.style16SemiBold(
                                  textColor: AppStyle.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Lengkapi data untuk\nmembuat akun',
                          textAlign: TextAlign.center,
                          style: MontserratFont.style24Bold(
                              textColor: AppStyle.black),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        WidgetTextFormField(
                          controller: ctrl.emailCtr,
                          errorText: ctrl.errorEmail,
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
                          height: 25,
                        ),
                        WidgetTextFormField(
                          controller: ctrl.firstNameCtr,
                          errorText: ctrl.errorFirstName,
                          hintText: 'nama depan',
                          textInputAction: TextInputAction.next,
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
                          height: 25,
                        ),
                        WidgetTextFormField(
                          controller: ctrl.lastNameCtr,
                          errorText: ctrl.errorLastName,
                          hintText: 'nama belakang',
                          textInputAction: TextInputAction.next,
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
                          height: 25,
                        ),
                        WidgetTextFormField(
                          controller: ctrl.passwordCtr,
                          errorText: ctrl.errorPassword,
                          obscureText: ctrl.isPassword,
                          hintText: 'buat password',
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          prefixIcon: SizedBox(
                            height: 30,
                            child: SvgPicture.asset(
                              AppConst.assetPadlock,
                              width: 16,
                              height: 16,
                              fit: BoxFit.scaleDown,
                              // ignore: deprecated_member_use
                              color: AppStyle.lightGrey02,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 30,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SvgPicture.asset(
                                ctrl.isPassword == true
                                    ? AppConst.assetEyeVisibilityOff
                                    : AppConst.assetEyeVisibility,
                                width: 16,
                                height: 16,
                                fit: BoxFit.scaleDown,
                              ),
                              onTap: () {
                                ctrl.isPassword == true
                                    ? ctrl.updateIsPassword(false)
                                    : ctrl.updateIsPassword(true);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        WidgetTextFormField(
                          controller: ctrl.confirmPasswordCtr,
                          errorText: ctrl.errorConfirmPassword,
                          obscureText: ctrl.isConfirmPassword,
                          hintText: 'konfirmasi password',
                          textInputAction: TextInputAction.done,
                          prefixIcon: SizedBox(
                            height: 30,
                            child: SvgPicture.asset(
                              AppConst.assetPadlock,
                              width: 16,
                              height: 16,
                              fit: BoxFit.scaleDown,
                              // ignore: deprecated_member_use
                              color: AppStyle.lightGrey02,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 30,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SvgPicture.asset(
                                ctrl.isConfirmPassword == true
                                    ? AppConst.assetEyeVisibilityOff
                                    : AppConst.assetEyeVisibility,
                                width: 16,
                                height: 16,
                                fit: BoxFit.scaleDown,
                              ),
                              onTap: () {
                                ctrl.isConfirmPassword == true
                                    ? ctrl.updateIsConfirmPassword(false)
                                    : ctrl.updateIsConfirmPassword(true);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        CustomButton(
                          onTap: ctrl.readySendToApi
                              ? () => ctrl.onPressRegister(context: context)
                              : () => ctrl.validation(),
                          name: 'Registrasi',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'sudah punya akun? login',
                              style: MontserratFont.style12(
                                  textColor: AppStyle.black),
                            ),
                            InkWell(
                              onTap: () => ctrl.toLoginScreen(),
                              child: Text(
                                ' di sini',
                                style: MontserratFont.style12(
                                    textColor: AppStyle.red500),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
