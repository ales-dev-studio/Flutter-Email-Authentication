class ResetPasswordParams {
  String? email;
  String? code;
  String? newPassword;

  ResetPasswordParams({this.email, this.code, this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = code;
    data['newPassword'] = newPassword;
    return data;
  }
}
