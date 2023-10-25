import '../../../components/base/base_dio_datasource.dart';
import '../../../components/ext/dio_ext.dart';
import '../model/transaction_history_request_model.dart';

class TransactionDataSource extends BaseDioDataSource {
  TransactionDataSource(super.client);

  Future<String> apiGetTransactionHistory(
      {required TransactionRequestModel req}) async {
    String path = 'transaction/history';
    return get<String>(path, queryParameters: req.toJson()).load();
  }
}
