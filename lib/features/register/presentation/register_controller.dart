import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_style.dart';
import '../../../components/util/state.dart';
import '../../../components/widget/loading_overlay/loading_screen.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

import '../repository/register_repository.dart';
import '../register_state.dart';

class RegisterController extends GetxController {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController confirmPasswordCtr = TextEditingController();

  String? errorEmail;
  String? errorFirstName;
  String? errorLastName;
  String? errorPassword;
  String? errorConfirmPassword;

  bool isPassword = true;
  bool isConfirmPassword = true;
  bool readySendToApi = false;

  RegisterState registerState = RegisterIdle();

  final RegisterRepository _repository;
  RegisterController(this._repository);

  @override
  void onInit() {
    _setUpInput();
    super.onInit();
  }

  _setUpInput() {
    emailCtr.addListener(() {
      _emailValidation();
    });
    firstNameCtr.addListener(() {
      _firstNameValidation();
    });
    lastNameCtr.addListener(() {
      _lastNameValidation();
    });
    passwordCtr.addListener(() {
      _passwordValidation();
    });
    confirmPasswordCtr.addListener(() {
      _confirmPasswordValidation();
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

  _firstNameValidation() {
    if (firstNameCtr.text.isEmpty) {
      errorFirstName = 'Nama Depan tidak boleh kosong';
    } else {
      errorFirstName = null;
    }
    _onReadyToApi();
    update();
  }

  _lastNameValidation() {
    if (lastNameCtr.text.isEmpty) {
      errorLastName = 'Nama Belakang tidak boleh kosong';
    } else {
      errorLastName = null;
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

  _confirmPasswordValidation() {
    if (confirmPasswordCtr.text.isEmpty) {
      errorConfirmPassword = 'Konfirmasi Password tidak boleh kosong';
    } else if (confirmPasswordCtr.text.length < 8) {
      errorConfirmPassword = 'Konfirmasi Password kurang dari 8 karakter';
    } else if (confirmPasswordCtr.text != passwordCtr.text) {
      errorConfirmPassword = 'Konfirmasi Password dan Password tidak sesuai!';
    } else {
      errorConfirmPassword = null;
    }
    _onReadyToApi();
    update();
  }

  _onReadyToApi() {
    if (emailCtr.text.isEmpty ||
        firstNameCtr.text.isEmpty ||
        lastNameCtr.text.isEmpty ||
        passwordCtr.text.isEmpty ||
        confirmPasswordCtr.text.isEmpty ||
        errorEmail != null ||
        errorFirstName != null ||
        errorLastName != null ||
        errorPassword != null ||
        errorConfirmPassword != null) {
      readySendToApi = false;
    } else {
      readySendToApi = true;
    }
  }

  void validation() {
    _emailValidation();
    _firstNameValidation();
    _lastNameValidation();
    _passwordValidation();
    _confirmPasswordValidation();
  }

  @override
  void onClose() {
    emailCtr.dispose();
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    passwordCtr.dispose();
    confirmPasswordCtr.dispose();
    super.onClose();
  }

  onPressRegister({required BuildContext context}) async {
    registerState = RegisterLoading();
    LoadingScreen().show(context: context, text: 'Mohon Tunggu');
    update();
    _repository.getSignUp(
      req: RegistrationRequestModel(
        email: emailCtr.text,
        firstName: firstNameCtr.text,
        lastName: lastNameCtr.text,
        password: passwordCtr.text,
      ),
      response: ResponseHandler(
        onSuccess: (res) {
          LoadingScreen().hide();
          registerState = RegisterSuccess();
          Get.back();
        },
        onFailed: (e, text) {
          LoadingScreen().hide();
          final String errorString = e.response!.data!;
          final error =
              RegistrationResponseModel.fromJson(jsonDecode(errorString));
          Get.snackbar(
            "Peringatan!",
            '${error.message}',
            snackPosition: SnackPosition.TOP,
            colorText: AppStyle.white,
            backgroundColor: AppStyle.red500,
          );
        },
        onDone: () {},
      ),
    );
  }

  void updateIsPassword(bool? value) {
    isPassword = value!;
    update();
  }

  void updateIsConfirmPassword(bool? value) {
    isConfirmPassword = value!;
    update();
  }

  void toLoginScreen() {
    Get.back();
  }
}
