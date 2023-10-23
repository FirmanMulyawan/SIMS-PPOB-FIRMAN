import '../../../../components/base/base_dio_datasource.dart';
import '../../../../components/ext/dio_ext.dart';
import '../model/register_request_model.dart';

class RegisterDataSource extends BaseDioDataSource {
  RegisterDataSource(super.client);

  Future<String> postRegister(RegistrationRequestModel req) {
    String path = 'registration';
    return post<String>(path, data: req.toJson()).load();
  }
}
