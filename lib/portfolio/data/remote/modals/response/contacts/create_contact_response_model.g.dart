// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContactResponseModel _$CreateContactResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateContactResponseModel(
  message: json['message'] as String,
  data: ContactData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateContactResponseModelToJson(
  CreateContactResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

ContactData _$ContactDataFromJson(Map<String, dynamic> json) => ContactData(
  title: json['title'] as String,
  url: json['url'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
