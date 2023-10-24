import '../../../components/base/base_repository.dart';
import '../../../components/util/state.dart';

import '../../profile/model/profile_response_model.dart';
import '../model/balance_response_model.dart';
import '../model/banner_response_model.dart';
import '../model/services_response_model.dart';

import './home_datasource.dart';

class HomeRepository extends BaseRepository {
  final HomeSource _dataSource;

  HomeRepository(this._dataSource);

  void getDataProfile({
    required ResponseHandler<ProfileResponseModel> response,
  }) async {
    try {
      final data = await _dataSource.apiProfile().then(mapToData).then((value) {
        final res = ProfileResponseModel.fromJson(value);
        return res;
      });

      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }

  void getDataBalance({
    required ResponseHandler<BalanceResponseModel> response,
  }) async {
    try {
      final data = await _dataSource.apiBalance().then(mapToData).then((value) {
        final res = BalanceResponseModel.fromJson(value);
        return res;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }

  void getDataBanner({
    required ResponseHandler<BannerResponseModel> response,
  }) async {
    try {
      final data = await _dataSource.apiBenner().then(mapToData).then((value) {
        final res = BannerResponseModel.fromJson(value);
        return res;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }

  void getDataServices({
    required ResponseHandler<ServicesResponseModel> response,
  }) async {
    try {
      final data =
          await _dataSource.apiServices().then(mapToData).then((value) {
        final res = ServicesResponseModel.fromJson(value);
        return res;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
