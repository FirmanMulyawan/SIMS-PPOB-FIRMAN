class BannerResponseModel {
  int? status;
  String? message;
  List<Data>? data;

  BannerResponseModel({this.status, this.message, this.data});

  BannerResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? bannerName;
  String? bannerImage;
  String? description;

  Data({this.bannerName, this.bannerImage, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_name'] = bannerName;
    data['banner_image'] = bannerImage;
    data['description'] = description;
    return data;
  }
}
