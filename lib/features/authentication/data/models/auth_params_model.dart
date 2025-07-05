class AuthParamsModel {
  String? email;
  String? password;

  AuthParamsModel({this.email, this.password});

  Map<String, dynamic> toJsonForRegister() => {
    "email": email,
    "password": password,
  };

  Map<String, dynamic> toJsonForLogin() => {
    "email": email,
    "password": password,
  };
}
