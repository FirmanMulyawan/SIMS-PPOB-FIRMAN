class TransactionResponseModel {
  int? status;
  String? message;
  Data? data;

  TransactionResponseModel({this.status, this.message, this.data});

  TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? invoiceNumber;
  String? serviceCode;
  String? serviceName;
  String? transactionType;
  int? totalAmount;
  String? createdOn;

  Data(
      {this.invoiceNumber,
      this.serviceCode,
      this.serviceName,
      this.transactionType,
      this.totalAmount,
      this.createdOn});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoice_number'];
    serviceCode = json['service_code'];
    serviceName = json['service_name'];
    transactionType = json['transaction_type'];
    totalAmount = json['total_amount'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_number'] = invoiceNumber;
    data['service_code'] = serviceCode;
    data['service_name'] = serviceName;
    data['transaction_type'] = transactionType;
    data['total_amount'] = totalAmount;
    data['created_on'] = createdOn;
    return data;
  }
}
