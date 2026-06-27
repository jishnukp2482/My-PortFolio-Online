// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_contacts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllContactsResponseModel _$AllContactsResponseModelFromJson(
  Map<String, dynamic> json,
) => AllContactsResponseModel(
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => ContactData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AllContactsResponseModelToJson(
  AllContactsResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

ContactData _$ContactDataFromJson(Map<String, dynamic> json) => ContactData(
  title: json['title'] as String,
  url: json['url'] as String,
  img: json['img'] as String,
  publicId: json['publicId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'img': instance.img,
      'publicId': instance.publicId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'order': instance.order,
    };
