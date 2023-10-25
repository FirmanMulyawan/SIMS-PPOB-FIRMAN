import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_route.dart';
import '../../../components/util/state.dart';
import '../../../components/util/storage_util.dart';
import '../model/profile_response_model.dart';
import '../profile_state.dart';
import '../../home/repository/home_repository.dart';

class ProfileController extends GetxController {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();

  String? errorEmail;
  String? errorFirstName;
  String? errorLastName;

  bool readOnly = true;
  bool readySendToApi = false;

  final HomeRepository _repository;
  final StorageUtil _storageUtil;

  ProfileUserState profileUserState = ProfileUserIdle();

  ProfileResponseModel? profile;

  ProfileController(this._repository, this._storageUtil);

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
    if (emailCtr.text.isEmpty ||
        firstNameCtr.text.isEmpty ||
        lastNameCtr.text.isEmpty ||
        errorEmail != null ||
        errorFirstName != null ||
        errorLastName != null) {
      readySendToApi = false;
    } else {
      readySendToApi = true;
    }
  }

  void validation() {
    _emailValidation();
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

  void _onLoadProfile() {
    profileUserState = ProfileUserLoading();
    update();
    _repository.getDataProfile(
        response: ResponseHandler(
            onSuccess: (data) async {
              profile = data;
              nameCtr.text = '${data.data?.firstName} ${data.data?.lastName}';
              emailCtr.text = data.data?.email ?? '';
              firstNameCtr.text = data.data?.firstName ?? '';
              lastNameCtr.text = data.data?.lastName ?? '';

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

  void onLogoutClick() {
    _storageUtil.logout();
    Get.offNamedUntil(AppRoute.login, (route) => false);
  }
}
