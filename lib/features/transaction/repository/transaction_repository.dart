import '../../../components/base/base_repository.dart';
import '../../../components/util/state.dart';

import './transaction_datasource.dart';
import '../model/transaction_history_request_model.dart';
import '../model/transaction_history_response_model.dart';

class TransactionRepository extends BaseRepository {
  final TransactionDataSource _dataSource;
  TransactionRepository(this._dataSource);

  void getTransaction({
    required ResponseHandler<List<Records>> response,
    required TransactionRequestModel req,
  }) async {
    try {
      final data = await _dataSource
          .apiGetTransactionHistory(req: req)
          .then(mapToData)
          .then((value) {
        final response = TransactionHistoryResponseModel.fromJson(value);
        List<Records> list = [];
        if (response.data?.records != null) {
          for (var e in response.data!.records!) {
            list.add(e);
          }
        }

        return list;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e, _) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
