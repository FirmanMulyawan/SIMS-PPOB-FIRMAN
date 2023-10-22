import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/util/state.dart';
import '../../../components/util/storage_util.dart';
import '../model/home_request_model.dart';
import '../model/home_response_model.dart';
import '../repository/home_repository.dart';
import '../homepage_state.dart';
import '../../../components/config/app_style.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final StorageUtil _storageUtil;

  List<Teams> list = [];
  List<Teams> searchList = [];
  HomePageState state = HomePageIdle();
  List<bool?> favoriteList = [];
  TextEditingController searchCtr = TextEditingController();

  HomeController(this._repository, this._storageUtil);

  @override
  void onInit() {
    _getListHomeData();
    super.onInit();
  }

  void onSearch(String value) {
    list = searchList.where((element) {
      final strTeam = element.strTeam?.toLowerCase();
      final query = value.toLowerCase();
      return strTeam!.contains(query);
    }).toList();
    update();
  }

  void onRefresh() {
    _getListHomeData();
    update();
  }

  _getListHomeData() async {
    state = HomePageLoading();
    _repository.getListNewTransaction(
      req: HomeRequestModel(l: 'English Premier League'),
      response: ResponseHandler(
          onSuccess: (data) {
            searchList = data;
            list = data;
            for (var i = 0; i < data.length; i++) {
              favoriteList.add(true);
              favoriteList[i] = false;
            }

            state = HomePageLoadSuccess();
            update();
          },
          onFailed: (e, text) {
            state = HomePageError();
          },
          onDone: () => update()),
    );
  }

  void toDetailProduct(element) async {
    Teams data = element;

    var currentLanguage = data.strDescriptionEN;

    if (currentLanguage != null) {
    } else {
      Get.snackbar(
        "Data not found",
        'please set the language again',
        snackPosition: SnackPosition.TOP,
        colorText: AppStyle.white,
        backgroundColor: AppStyle.red,
      );
    }
  }

  @override
  void onClose() {
    searchCtr.dispose();
    super.onClose();
  }
}
