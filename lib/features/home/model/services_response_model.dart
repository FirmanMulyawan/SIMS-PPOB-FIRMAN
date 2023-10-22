class ServicesResponseModel {
  int? status;
  String? message;
  List<Data>? data;

  ServicesResponseModel({this.status, this.message, this.data});

  ServicesResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceCode;
  String? serviceName;
  String? serviceIcon;
  int? serviceTariff;

  Data(
      {this.serviceCode,
      this.serviceName,
      this.serviceIcon,
      this.serviceTariff});

  Data.fromJson(Map<String, dynamic> json) {
    serviceCode = json['service_code'];
    serviceName = json['service_name'];
    serviceIcon = json['service_icon'];
    serviceTariff = json['service_tariff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_code'] = serviceCode;
    data['service_name'] = serviceName;
    data['service_icon'] = serviceIcon;
    data['service_tariff'] = serviceTariff;
    return data;
  }
}
