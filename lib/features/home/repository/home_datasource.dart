import '../../../components/base/base_dio_datasource.dart';
import '../../../components/ext/dio_ext.dart';
import '../model/home_request_model.dart';

class HomeDataSource extends BaseDioDataSource {
  HomeDataSource(super.client);

  Future<String> apiGetListHistory({required HomeRequestModel req}) {
    String path = 'v1/json/3/search_all_teams.php';
    return get<String>(path, queryParameters: req.toJson()).load();
  }
}
