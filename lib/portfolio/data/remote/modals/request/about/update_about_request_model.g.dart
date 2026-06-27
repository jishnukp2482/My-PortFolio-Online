// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_about_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAboutRequestModel _$UpdateAboutRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateAboutRequestModel(
  aboutDescription: json['aboutDescription'] as String,
  professionalExperience: (json['professionalExperience'] as List<dynamic>)
      .map(
        (e) =>
            ProfessionalExperienceRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  certifications: (json['certifications'] as List<dynamic>)
      .map((e) => CertificationRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  educations: (json['educations'] as List<dynamic>)
      .map((e) => EducationRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  technicalSkills: (json['technicalSkills'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  softSkills: (json['softSkills'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateAboutRequestModelToJson(
  UpdateAboutRequestModel instance,
) => <String, dynamic>{
  'aboutDescription': instance.aboutDescription,
  'professionalExperience': instance.professionalExperience
      .map((e) => e.toJson())
      .toList(),
  'certifications': instance.certifications.map((e) => e.toJson()).toList(),
  'educations': instance.educations.map((e) => e.toJson()).toList(),
  'technicalSkills': instance.technicalSkills,
  'softSkills': instance.softSkills,
};

ProfessionalExperienceRequest _$ProfessionalExperienceRequestFromJson(
  Map<String, dynamic> json,
) => ProfessionalExperienceRequest(
  role: json['role'] as String,
  companyName: json['companyName'] as String,
  duration: json['duration'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$ProfessionalExperienceRequestToJson(
  ProfessionalExperienceRequest instance,
) => <String, dynamic>{
  'role': instance.role,
  'companyName': instance.companyName,
  'duration': instance.duration,
  'description': instance.description,
};

CertificationRequest _$CertificationRequestFromJson(
  Map<String, dynamic> json,
) => CertificationRequest(
  title: json['title'] as String,
  year: json['year'] as String,
);

Map<String, dynamic> _$CertificationRequestToJson(
  CertificationRequest instance,
) => <String, dynamic>{'title': instance.title, 'year': instance.year};

EducationRequest _$EducationRequestFromJson(Map<String, dynamic> json) =>
    EducationRequest(
      title: json['title'] as String,
      institute: json['institute'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$EducationRequestToJson(EducationRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'institute': instance.institute,
      'year': instance.year,
    };
