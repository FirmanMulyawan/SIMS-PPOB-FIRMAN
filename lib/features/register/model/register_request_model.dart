class RegistrationRequestModel {
  String? email;
  String? firstName;
  String? lastName;
  String? password;

  RegistrationRequestModel(
      {this.email, this.firstName, this.lastName, this.password});

  RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['password'] = password;
    return data;
  }
}
