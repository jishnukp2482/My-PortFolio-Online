// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_resume_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadResumeResponseModel _$DownloadResumeResponseModelFromJson(
  Map<String, dynamic> json,
) => DownloadResumeResponseModel(
  message: json['message'] as String,
  data: ResumeData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DownloadResumeResponseModelToJson(
  DownloadResumeResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

ResumeData _$ResumeDataFromJson(Map<String, dynamic> json) => ResumeData(
  fileUrl: json['fileUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$ResumeDataToJson(ResumeData instance) =>
    <String, dynamic>{
      'fileUrl': instance.fileUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
