// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutResponseModel _$AboutResponseModelFromJson(Map<String, dynamic> json) =>
    AboutResponseModel(
      message: json['message'] as String,
      data: AboutData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AboutResponseModelToJson(AboutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

AboutData _$AboutDataFromJson(Map<String, dynamic> json) => AboutData(
  aboutDescription: json['aboutDescription'] as String,
  certifications:
      (json['certifications'] as List<dynamic>?)
          ?.map((e) => Certification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  educations:
      (json['educations'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  professionalExperience:
      (json['professionalExperience'] as List<dynamic>?)
          ?.map(
            (e) => ProfessionalExperience.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
  softSkills:
      (json['softSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  technicalSkills:
      (json['technicalSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$AboutDataToJson(AboutData instance) => <String, dynamic>{
  'aboutDescription': instance.aboutDescription,
  'certifications': instance.certifications.map((e) => e.toJson()).toList(),
  'educations': instance.educations.map((e) => e.toJson()).toList(),
  'professionalExperience': instance.professionalExperience
      .map((e) => e.toJson())
      .toList(),
  'softSkills': instance.softSkills,
  'technicalSkills': instance.technicalSkills,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'id': instance.id,
};

Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    Certification(
      title: json['title'] as String,
      year: json['year'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CertificationToJson(Certification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'id': instance.id,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
  title: json['title'] as String,
  institute: json['institute'] as String,
  year: json['year'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
  'title': instance.title,
  'institute': instance.institute,
  'year': instance.year,
  'id': instance.id,
};

ProfessionalExperience _$ProfessionalExperienceFromJson(
  Map<String, dynamic> json,
) => ProfessionalExperience(
  role: json['role'] as String,
  companyName: json['companyName'] as String,
  duration: json['duration'] as String,
  description: json['description'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$ProfessionalExperienceToJson(
  ProfessionalExperience instance,
) => <String, dynamic>{
  'role': instance.role,
  'companyName': instance.companyName,
  'duration': instance.duration,
  'description': instance.description,
  'id': instance.id,
};
