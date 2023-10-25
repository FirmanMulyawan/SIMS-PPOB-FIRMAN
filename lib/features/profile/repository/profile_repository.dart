import '../../../components/base/base_repository.dart';
import '../../../components/util/state.dart';

import './profile_datasource.dart';
import '../model/profile_update_request_model.dart';
import '../model/profile_update_response_model.dart';

class ProfileRepository extends BaseRepository {
  final ProfileDataSource _dataSource;
  ProfileRepository(this._dataSource);

  void putEditProfile(
      {required ResponseHandler<ProfileUpdateResponseModel> response,
      required ProfileUpdateRequestModel req}) async {
    try {
      final data = await _dataSource.putEditProfile(req).then(mapToData).then(
        (value) {
          return ProfileUpdateResponseModel.fromJson(value);
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
