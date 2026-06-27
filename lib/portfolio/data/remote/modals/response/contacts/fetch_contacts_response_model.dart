import 'package:json_annotation/json_annotation.dart';

part 'fetch_contacts_response_model.g.dart';

@JsonSerializable()
class AllContactsResponseModel {
  final String message;
  final List<ContactData> data;

  AllContactsResponseModel({
    required this.message,
    required this.data,
  });

  factory AllContactsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllContactsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllContactsResponseModelToJson(this);
}

@JsonSerializable()
class ContactData {
  final String title;
  final String url;
  final String img;
  final String publicId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final int order;

  ContactData({
    required this.title,
    required this.url,
    required this.img,
    required this.publicId,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.order,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDataToJson(this);
}
