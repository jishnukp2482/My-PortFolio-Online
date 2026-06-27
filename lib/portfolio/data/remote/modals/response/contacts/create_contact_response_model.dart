import 'package:json_annotation/json_annotation.dart';

part 'create_contact_response_model.g.dart';

@JsonSerializable()
class CreateContactResponseModel {
  final String message;
  final ContactData data;

  CreateContactResponseModel({
    required this.message,
    required this.data,
  });

  factory CreateContactResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContactResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContactResponseModelToJson(this);
}

@JsonSerializable()
class ContactData {
  final String title;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  ContactData({
    required this.title,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDataToJson(this);
}
