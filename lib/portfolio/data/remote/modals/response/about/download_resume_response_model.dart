import 'package:json_annotation/json_annotation.dart';

part 'download_resume_response_model.g.dart';

@JsonSerializable()
class DownloadResumeResponseModel {
  final String message;
  final ResumeData data;

  DownloadResumeResponseModel({
    required this.message,
    required this.data,
  });

  factory DownloadResumeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DownloadResumeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadResumeResponseModelToJson(this);
}
@JsonSerializable()
class ResumeData {
  final String fileUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  ResumeData({
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory ResumeData.fromJson(Map<String, dynamic> json) =>
      _$ResumeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeDataToJson(this);
}
