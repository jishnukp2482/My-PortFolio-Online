// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponseModel _$ProjectResponseModelFromJson(
  Map<String, dynamic> json,
) => ProjectResponseModel(
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$ProjectResponseModelToJson(
  ProjectResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
};

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) => ProjectData(
  projectName: json['projectName'] as String,
  show: json['show'] as bool,
  order: (json['order'] as num).toInt(),
  subDescription: json['subDescription'] as String,
  projectDescription: json['projectDescription'] as String,
  imgUrls:
      (json['imgUrls'] as List<dynamic>?)
          ?.map((e) => ProjectImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  keyFeatures:
      (json['keyFeatures'] as List<dynamic>?)
          ?.map((e) => KeyFeature.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  technologies:
      (json['technologies'] as List<dynamic>?)
          ?.map((e) => ProjectTechnology.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  publishOn:
      (json['publishOn'] as List<dynamic>?)
          ?.map((e) => PublishOn.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  defaultPublishOnDescription: json['defaultPublishOnDescription'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'show': instance.show,
      'order': instance.order,
      'subDescription': instance.subDescription,
      'projectDescription': instance.projectDescription,
      'imgUrls': instance.imgUrls.map((e) => e.toJson()).toList(),
      'keyFeatures': instance.keyFeatures.map((e) => e.toJson()).toList(),
      'technologies': instance.technologies.map((e) => e.toJson()).toList(),
      'publishOn': instance.publishOn.map((e) => e.toJson()).toList(),
      'defaultPublishOnDescription': instance.defaultPublishOnDescription,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };

ProjectImage _$ProjectImageFromJson(Map<String, dynamic> json) => ProjectImage(
  imgUrl: json['imgUrl'] as String,
  publicId: json['publicId'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$ProjectImageToJson(ProjectImage instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'publicId': instance.publicId,
      'id': instance.id,
    };

KeyFeature _$KeyFeatureFromJson(Map<String, dynamic> json) =>
    KeyFeature(feature: json['feature'] as String, id: json['id'] as String);

Map<String, dynamic> _$KeyFeatureToJson(KeyFeature instance) =>
    <String, dynamic>{'feature': instance.feature, 'id': instance.id};

ProjectTechnology _$ProjectTechnologyFromJson(Map<String, dynamic> json) =>
    ProjectTechnology(
      description: json['description'] as String,
      technologies: json['technologies'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ProjectTechnologyToJson(ProjectTechnology instance) =>
    <String, dynamic>{
      'description': instance.description,
      'technologies': instance.technologies,
      'id': instance.id,
    };

PublishOn _$PublishOnFromJson(Map<String, dynamic> json) => PublishOn(
  platform: json['platform'] as String,
  url: json['url'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$PublishOnToJson(PublishOn instance) => <String, dynamic>{
  'platform': instance.platform,
  'url': instance.url,
  'id': instance.id,
};
