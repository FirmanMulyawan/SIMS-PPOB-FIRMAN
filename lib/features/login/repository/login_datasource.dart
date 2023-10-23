import '../../../../components/base/base_dio_datasource.dart';
import '../../../../components/ext/dio_ext.dart';
import '../model/login_request_model.dart';

class LoginDataSource extends BaseDioDataSource {
  LoginDataSource(super.client);

  Future<String> postLogin(LoginRequestModel req) {
    String path = 'login';
    return post<String>(path, data: req.toJson()).load();
  }
}
