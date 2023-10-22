class TransactionRequestModel {
  String? serviceCode;

  TransactionRequestModel({this.serviceCode});

  TransactionRequestModel.fromJson(Map<String, dynamic> json) {
    serviceCode = json['service_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_code'] = serviceCode;
    return data;
  }
}
