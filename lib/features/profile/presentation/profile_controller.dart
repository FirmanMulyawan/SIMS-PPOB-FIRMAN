import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_route.dart';
import '../../../components/config/app_style.dart';
import '../../../components/util/state.dart';
import '../../../components/util/storage_util.dart';
import '../../../components/widget/loading_overlay/loading_screen.dart';

import '../model/profile_update_request_model.dart';
import '../model/profile_update_response_model.dart';
import '../repository/profile_repository.dart';
import '../../home/repository/home_repository.dart';

import '../profile_state.dart';

class ProfileController extends GetxController {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController firstNameMasterCtr = TextEditingController();
  TextEditingController lastNameMasterCtr = TextEditingController();

  String? errorEmail;
  String? errorFirstName;
  String? errorLastName;

  bool readOnly = true;
  bool readySendToApi = false;

  final HomeRepository _repository;
  final ProfileRepository _profileRepository;
  final StorageUtil _storageUtil;

  ProfileUserState profileUserState = ProfileUserIdle();
  ProfileEditState profileEditState = ProfileEditIdle();

  ProfileController(
      this._repository, this._profileRepository, this._storageUtil);

  @override
  void onInit() {
    _setUpInput();
    _onLoadProfile();
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

  _onReadyToApi() {
    if (firstNameCtr.text.isEmpty ||
        lastNameCtr.text.isEmpty ||
        errorFirstName != null ||
        errorLastName != null) {
      readySendToApi = false;
    } else {
      readySendToApi = true;
    }
  }

  void validation() {
    _firstNameValidation();
    _lastNameValidation();
  }

  @override
  void onClose() {
    emailCtr.dispose();
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    super.onClose();
  }

  onPressEditProfile({required BuildContext context}) async {
    profileEditState = ProfileEditLoading();
    LoadingScreen().show(context: context, text: 'Mohon Tunggu');
    update();
    _profileRepository.putEditProfile(
      req: ProfileUpdateRequestModel(
          firstName: firstNameCtr.text, lastName: lastNameCtr.text),
      response: ResponseHandler(
        onSuccess: (response) {
          nameCtr.text =
              '${response.data?.firstName} ${response.data?.lastName}';
          emailCtr.text = response.data?.email ?? '';
          firstNameCtr.text = response.data?.firstName ?? '';
          lastNameCtr.text = response.data?.lastName ?? '';
          firstNameMasterCtr.text = response.data?.firstName ?? '';
          lastNameMasterCtr.text = response.data?.lastName ?? '';
          LoadingScreen().hide();
          profileEditState = ProfileEditSuccess();
          readOnly = true;
        },
        onFailed: (e, text) {
          LoadingScreen().hide();
          final String errorString = e.response!.data!;
          final error =
              ProfileUpdateResponseModel.fromJson(jsonDecode(errorString));
          Get.snackbar(
            "Peringatan!",
            '${error.message}',
            snackPosition: SnackPosition.TOP,
            colorText: AppStyle.white,
            backgroundColor: AppStyle.red500,
          );
        },
        onDone: () => update(),
      ),
    );
  }

  void _onLoadProfile() {
    profileUserState = ProfileUserLoading();
    update();
    _repository.getDataProfile(
        response: ResponseHandler(
            onSuccess: (data) async {
              nameCtr.text = '${data.data?.firstName} ${data.data?.lastName}';
              emailCtr.text = data.data?.email ?? '';
              firstNameCtr.text = data.data?.firstName ?? '';
              lastNameCtr.text = data.data?.lastName ?? '';
              firstNameMasterCtr.text = data.data?.firstName ?? '';
              lastNameMasterCtr.text = data.data?.lastName ?? '';

              profileUserState = ProfileUserSuccess();
            },
            onFailed: (responseError, message) {
              profileUserState = ProfileUserError();
            },
            onDone: () => update()));
  }

  void updateReadOnly(bool? value) {
    readOnly = value ?? true;
    update();
  }

  void cancelEditProfile(bool? value) {
    firstNameCtr.text = firstNameMasterCtr.text;
    lastNameCtr.text = lastNameMasterCtr.text;
    readOnly = value ?? true;
    update();
  }

  void onLogoutClick() {
    _storageUtil.logout();
    Get.offNamedUntil(AppRoute.login, (route) => false);
  }
}
