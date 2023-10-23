import '../../../../components/base/base_repository.dart';
import '../../../../components/util/state.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import './login_datasource.dart';

class LoginRepository extends BaseRepository {
  final LoginDataSource _dataSource;
  LoginRepository(this._dataSource);

  void postLogin(
      {required ResponseHandler<LoginResponseModel> response,
      required LoginRequestModel req}) async {
    try {
      final data = await _dataSource.postLogin(req).then(mapToData).then(
        (value) {
          return LoginResponseModel.fromJson(value);
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
