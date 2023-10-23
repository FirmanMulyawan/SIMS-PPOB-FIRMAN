import '../../../../components/base/base_repository.dart';
import '../../../../components/util/state.dart';

import '../model/register_response_model.dart';
import '../model/register_request_model.dart';
import 'register_datasource.dart';

class RegisterRepository extends BaseRepository {
  final RegisterDataSource _dataSource;
  RegisterRepository(this._dataSource);

  void getSignUp(
      {required ResponseHandler<RegistrationResponseModel> response,
      required RegistrationRequestModel req}) async {
    try {
      final data = await _dataSource.postRegister(req).then(mapToData).then(
        (value) {
          return RegistrationResponseModel.fromJson(value);
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
