// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProjectResponseModel _$UpdateProjectResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdateProjectResponseModel(
  message: json['message'] as String,
  data: ProjectData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProjectResponseModelToJson(
  UpdateProjectResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data.toJson(),
};
