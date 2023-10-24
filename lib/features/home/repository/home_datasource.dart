import '../../../components/base/base_dio_datasource.dart';
import '../../../components/ext/dio_ext.dart';

class HomeSource extends BaseDioDataSource {
  HomeSource(super.client);

  Future<String> apiProfile() {
    String path = 'profile';
    return get<String>(path).load();
  }

  Future<String> apiBalance() {
    String path = 'balance';
    return get<String>(path).load();
  }

  Future<String> apiServices() {
    String path = 'services';
    return get<String>(path).load();
  }

  Future<String> apiBenner() {
    String path = 'banner';
    return get<String>(path).load();
  }
}
