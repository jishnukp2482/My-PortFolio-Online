import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final LoginDataModel data;

  LoginResponseModel({
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginDataModel {
  final AdminModel admin;
  final String accessToken;
  final String refreshToken;

  LoginDataModel({
    required this.admin,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}


@JsonSerializable()
class AdminModel {
  final String id;
  final String email;

  AdminModel({
    required this.id,
    required this.email,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminModelToJson(this);
}