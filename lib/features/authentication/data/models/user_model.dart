import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/get_media_type.dart';

class UserModel {
  int? id;
  String? clientId;
  String? email;
  bool? isEmailVerified;
  String? firstName;
  String? lastName;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? picture;
  XFile? pictureVarForUpload;
  String? birthDate;
  String? gender;

  UserModel({
    this.id,
    this.clientId,
    this.email,
    this.isEmailVerified,
    this.firstName,
    this.lastName,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.picture,
    this.pictureVarForUpload,
    this.birthDate,
    this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    email = json['email'];
    isEmailVerified = json['isEmailVerified'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    picture = json['picture'];
    birthDate = json['picture'];
    gender = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    return data;
  }

  Future<FormData> toMultipartJson() async {
    String pictureName = pictureVarForUpload!.path.split('/').last;

    final FormData data = FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'birthDate': birthDate,
      'gender': gender,
      'picture': await MultipartFile.fromFile(
        pictureVarForUpload!.path,
        filename: pictureName,
        contentType: getMediaType(pictureName),
      ),
    });
    return data;
  }
}
