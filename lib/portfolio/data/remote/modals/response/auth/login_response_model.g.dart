// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String,
      data: LoginDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      admin: AdminModel.fromJson(json['admin'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) =>
    AdminModel(id: json['id'] as String, email: json['email'] as String);

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{'id': instance.id, 'email': instance.email};
