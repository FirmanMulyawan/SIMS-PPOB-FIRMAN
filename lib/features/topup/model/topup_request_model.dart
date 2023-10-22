class TopUpRequestModel {
  int? topUpAmount;

  TopUpRequestModel({this.topUpAmount});

  TopUpRequestModel.fromJson(Map<String, dynamic> json) {
    topUpAmount = json['top_up_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['top_up_amount'] = topUpAmount;
    return data;
  }
}
