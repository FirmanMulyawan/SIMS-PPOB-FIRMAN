class TransactionRequestModel {
  int? offset;
  int? limit;

  TransactionRequestModel({this.offset, this.limit});

  TransactionRequestModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    return data;
  }
}
