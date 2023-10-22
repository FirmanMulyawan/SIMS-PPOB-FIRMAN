import '../../../components/base/base_repository.dart';
import '../../../components/util/state.dart';

import '../model/home_request_model.dart';
import '../model/home_response_model.dart';

import './home_datasource.dart';

class HomeRepository extends BaseRepository {
  final HomeDataSource _dataSource;
  HomeRepository(this._dataSource);

  void getListNewTransaction({
    required ResponseHandler<List<Teams>> response,
    required HomeRequestModel req,
  }) async {
    try {
      final data =
          await _dataSource.apiGetListHistory(req: req).then(mapToData).then(
        (value) {
          final response = HomeResponseModel.fromJson(value);
          List<Teams> list = [];
          if (response.teams != null) {
            for (var e in response.teams!) {
              list.add(e);
            }
          }
          return list;
        },
      );
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
