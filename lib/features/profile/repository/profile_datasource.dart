import '../../../components/base/base_dio_datasource.dart';
import '../../../components/ext/dio_ext.dart';
import '../model/profile_update_request_model.dart';

class ProfileDataSource extends BaseDioDataSource {
  ProfileDataSource(super.client);

  Future<String> putEditProfile(ProfileUpdateRequestModel model) {
    String path = 'profile/update';
    return put<String>(path, data: model.toJson()).load();
  }
}
