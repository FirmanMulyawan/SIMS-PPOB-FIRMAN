import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/base/base_error_model.dart';
import '../../../components/util/state.dart';
import '../../home/repository/home_repository.dart';
import '../transaction_state.dart';

import '../model/transaction_history_response_model.dart';
import '../model/transaction_history_request_model.dart';
import '../repository/transaction_repository.dart';

class TransactionController extends GetxController {
  TextEditingController saldo = TextEditingController();

  int page = 0;
  int size = 5;
  bool loadMore = true;
  bool onLoadMore = false;
  List<Records> dataTransaction = [];

  TransactionBalanceState transactionBalanceState = TransactionBalanceIdle();
  TransactionState transactionState = TransactionIdle();

  final HomeRepository _repositoryHome;
  final TransactionRepository _repository;
  TransactionController(this._repositoryHome, this._repository);

  @override
  void onInit() {
    _onLoadBalance();
    initGetTransactionData();
    super.onInit();
  }

  initGetTransactionData() {
    if (page == 0) {
      transactionState = TransactionLoading();
      dataTransaction = [];
      loadMore = true;
      onLoadMore = true;
      update();
    } else {
      onLoadMore = true;
      update();
    }
    _repository.getTransaction(
      response: ResponseHandler(
          onSuccess: (data) {
            transactionState = TransactionSuccess();
            // if (data.isNotEmpty) _getDataTransaction(data: data);
          },
          onFailed: (e, text) {
            transactionState = TransactionSuccess();
            final String errorString = e.response!.data!;
            final error = BaseErrorModel.fromJson(jsonDecode(errorString));
            if (error.message == 'Data not found' && page == 0) {
              transactionState = TransactionEmpty();
            } else if (error.message == 'Data not found' && page > 0) {
              dataTransaction = dataTransaction;
              loadMore = false;
              onLoadMore = false;
            } else {
              transactionState = TransactionError();
            }
          },
          onDone: () => update()),
      req: TransactionRequestModel(offset: page, limit: size),
    );
  }

  // _getDataTransaction({
  //   required List<Records> data,
  // }) {
  //   if (data.length < size) {
  //     loadMore = false;
  //   }

  //   onLoadMore = false;

  //   if (page == 1) {
  //     dataTransaction = data;
  //   } else {
  //     dataTransaction.addAll(data);
  //   }
  //   page++;
  // }

  void _onLoadBalance() {
    transactionBalanceState = TransactionBalanceLoading();
    update();
    _repositoryHome.getDataBalance(
        response: ResponseHandler(
            onSuccess: (data) async {
              saldo.text = data.data?.balance.toString() ?? '';
              transactionBalanceState = TransactionBalanceSuccess();
            },
            onFailed: (responseError, message) {
              transactionBalanceState = TransactionBalanceError();
            },
            onDone: () => update()));
  }
}
