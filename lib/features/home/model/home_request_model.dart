class HomeRequestModel {
  String? l;

  HomeRequestModel({this.l});

  HomeRequestModel.fromJson(Map<String, dynamic> json) {
    l = json['l'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['l'] = l;
    return data;
  }
}
