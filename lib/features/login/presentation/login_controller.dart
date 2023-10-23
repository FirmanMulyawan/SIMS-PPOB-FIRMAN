import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../../../components/util/storage_util.dart';
import '../../../components/util/state.dart';
import '../../../components/widget/loading_overlay/loading_screen.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import '../repository/login_repository.dart';
import '../login_state.dart';

class LoginController extends GetxController {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  String? errorEmail;
  String? errorPassword;

  bool isPassword = true;
  bool readySendToApi = false;

  LoginState loadingState = LoginIdle();

  final LoginRepository _repository;
  final StorageUtil _storageUtil;

  LoginController(this._repository, this._storageUtil);

  @override
  void onInit() {
    _setUpInput();
    super.onInit();
  }

  _setUpInput() {
    emailCtr.addListener(() {
      _emailValidation();
    });
    passwordCtr.addListener(() {
      _passwordValidation();
    });
  }

  _emailValidation() {
    if (emailCtr.text.isEmpty) {
      errorEmail = 'Email tidak boleh kosong';
    } else if (!emailCtr.text.isEmail) {
      errorEmail = 'Email tidak sesuai format';
    } else {
      errorEmail = null;
    }
    _onReadyToApi();
    update();
  }

  _passwordValidation() {
    if (passwordCtr.text.isEmpty) {
      errorPassword = 'Password tidak boleh kosong';
    } else if (passwordCtr.text.length < 8) {
      errorPassword = 'Password kurang dari 8 karakter';
    } else {
      errorPassword = null;
    }
    _onReadyToApi();
    update();
  }

  _onReadyToApi() {
    if (emailCtr.text.isEmpty ||
        passwordCtr.text.isEmpty ||
        errorEmail != null ||
        errorPassword != null) {
      readySendToApi = false;
    } else {
      readySendToApi = true;
    }
  }

  void validation() {
    _emailValidation();
    _passwordValidation();
  }

  @override
  void onClose() {
    emailCtr.dispose();
    passwordCtr.dispose();
    super.onClose();
  }

  void onPressLogin({required BuildContext context}) {
    loadingState = LoginLoading();
    LoadingScreen().show(context: context, text: 'Mohon Tunggu');
    update();
    _repository.postLogin(
        req:
            LoginRequestModel(email: emailCtr.text, password: passwordCtr.text),
        response: ResponseHandler(
          onSuccess: (data) {
            _storageUtil.setUserToken(data.data!.token!);
            _storageUtil.setLogin(true.toString());
            LoadingScreen().hide();
            loadingState = LoginSuccess();
            toHomeScreen();
          },
          onFailed: (e, text) {
            LoadingScreen().hide();
            final String errorString = e.response!.data!;
            final error = LoginResponseModel.fromJson(jsonDecode(errorString));
            Get.snackbar(
              "Peringatan!",
              '${error.message}',
              snackPosition: SnackPosition.TOP,
              colorText: AppStyle.white,
              backgroundColor: AppStyle.red500,
            );
          },
          onDone: () {
            LoadingScreen().hide();
            update();
          },
        ));
  }

  void toHomeScreen() {
    Get.closeAllSnackbars();
    Get.offNamedUntil(AppRoute.homeNavigationScreen, (route) => false);
  }

  void updateIsPassword(bool? value) {
    isPassword = value!;
    update();
  }

  void toRegisterScreen() {
    Get.toNamed(AppRoute.register);
  }
}
