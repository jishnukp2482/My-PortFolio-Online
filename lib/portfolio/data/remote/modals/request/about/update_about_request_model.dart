import 'package:json_annotation/json_annotation.dart';

part 'update_about_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateAboutRequestModel {
  final String aboutDescription;
  final List<ProfessionalExperienceRequest> professionalExperience;
  final List<CertificationRequest> certifications;
  final List<EducationRequest> educations;
  final List<String> technicalSkills;
  final List<String> softSkills;

  UpdateAboutRequestModel({
    required this.aboutDescription,
    required this.professionalExperience,
    required this.certifications,
    required this.educations,
    required this.technicalSkills,
    required this.softSkills,
  });

  factory UpdateAboutRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateAboutRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAboutRequestModelToJson(this);
}
@JsonSerializable()
class ProfessionalExperienceRequest {
  final String role;
  final String companyName;
  final String duration;
  final String description;

  ProfessionalExperienceRequest({
    required this.role,
    required this.companyName,
    required this.duration,
    required this.description,
  });

  factory ProfessionalExperienceRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalExperienceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionalExperienceRequestToJson(this);
}
@JsonSerializable()
class CertificationRequest {
  final String title;
  final String year;

  CertificationRequest({
    required this.title,
    required this.year,
  });

  factory CertificationRequest.fromJson(Map<String, dynamic> json) =>
      _$CertificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationRequestToJson(this);
}
@JsonSerializable()
class EducationRequest {
  final String title;
  final String institute;
  final String year;

  EducationRequest({
    required this.title,
    required this.institute,
    required this.year,
  });

  factory EducationRequest.fromJson(Map<String, dynamic> json) =>
      _$EducationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EducationRequestToJson(this);
}
