import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../repository/home_repository.dart';
import '../homepage_state.dart';
import '../../../components/util/state.dart';
import '../../profile/model/profile_response_model.dart';
import '../model/balance_response_model.dart';
import '../model/banner_response_model.dart';
import '../model/services_response_model.dart';

class HomeController extends GetxController {
  bool isObscureText = true;
  TextEditingController saldo = TextEditingController();

  ProfileState profileState = ProfileIdle();
  BalanceState balanceState = BalanceIdle();
  ServicesState servicesState = ServicesLoading();
  BannerState bannerState = BannerIdle();

  ProfileResponseModel? profile;
  BalanceResponseModel? balance;
  BannerResponseModel? banner;
  ServicesResponseModel? services;

  final CarouselController carouselController = CarouselController();
  RxInt current = 0.obs;

  final HomeRepository _repository;
  HomeController(this._repository);

  @override
  void onInit() {
    _onLoadProfile();
    _onLoadBalance();
    _onLoadBanner();
    _onLoadDServices();
    super.onInit();
  }

  void _onLoadProfile() {
    profileState = ProfileLoading();
    update();
    _repository.getDataProfile(
        response: ResponseHandler(
            onSuccess: (data) async {
              profile = data;
              profileState = ProfileSuccess();
            },
            onFailed: (responseError, message) {
              profileState = ProfileError();
            },
            onDone: () => update()));
  }

  void _onLoadBalance() {
    balanceState = BalanceLoading();
    update();
    _repository.getDataBalance(
        response: ResponseHandler(
            onSuccess: (data) async {
              balance = data;
              saldo.text = data.data?.balance.toString() ?? '';
              balanceState = BalanceSuccess();
            },
            onFailed: (responseError, message) {
              balanceState = BalanceError();
            },
            onDone: () => update()));
  }

  void _onLoadBanner() {
    bannerState = BannerLoading();
    update();
    _repository.getDataBanner(
        response: ResponseHandler(
            onSuccess: (data) async {
              banner = data;
              bannerState = BannerSuccess();
            },
            onFailed: (responseError, message) {
              bannerState = BannerError();
            },
            onDone: () => update()));
  }

  void _onLoadDServices() {
    servicesState = ServicesLoading();
    update();
    _repository.getDataServices(
        response: ResponseHandler(
            onSuccess: (data) async {
              services = data;
              servicesState = ServicesSuccess();
              update();
            },
            onFailed: (responseError, message) {
              servicesState = ServicesError();
            },
            onDone: () => update()));
  }

  void updateIsObscureText(bool? value) {
    isObscureText = value!;
    update();
  }

  void changeIndexCarrousel(int value) {
    current.value = value;
  }
}
