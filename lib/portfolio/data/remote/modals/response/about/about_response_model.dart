import 'package:json_annotation/json_annotation.dart';

part 'about_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AboutResponseModel {
  final String message;
  final AboutData data;

  AboutResponseModel({
    required this.message,
    required this.data,
  });

  factory AboutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AboutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutResponseModelToJson(this);

  ///copywith for update
  AboutResponseModel copyWith({
    String? message,
    AboutData? data,
  }) {
    return AboutResponseModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AboutData {
  final String aboutDescription;

  @JsonKey(defaultValue: [])
  final List<Certification> certifications;

  @JsonKey(defaultValue: [])
  final List<Education> educations;

  @JsonKey(defaultValue: [])
  final List<ProfessionalExperience> professionalExperience;

  @JsonKey(defaultValue: [])
  final List<String> softSkills;

  @JsonKey(defaultValue: [])
  final List<String> technicalSkills;

  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  AboutData({
    required this.aboutDescription,
    required this.certifications,
    required this.educations,
    required this.professionalExperience,
    required this.softSkills,
    required this.technicalSkills,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory AboutData.fromJson(Map<String, dynamic> json) =>
      _$AboutDataFromJson(json);

  Map<String, dynamic> toJson() => _$AboutDataToJson(this);

  ///copywith for updating about

  AboutData copyWith({
    String? aboutDescription,
    List<Certification>? certifications,
    List<Education>? educations,
    List<ProfessionalExperience>? professionalExperience,
    List<String>? softSkills,
    List<String>? technicalSkills,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
  }) {
    return AboutData(
      aboutDescription: aboutDescription ?? this.aboutDescription,
      certifications: certifications ?? this.certifications,
      educations: educations ?? this.educations,
      professionalExperience:
          professionalExperience ?? this.professionalExperience,
      softSkills: softSkills ?? this.softSkills,
      technicalSkills: technicalSkills ?? this.technicalSkills,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Certification {
  final String title;
  final String year;
  final String id;

  Certification({
    required this.title,
    required this.year,
    required this.id,
  });

  factory Certification.fromJson(Map<String, dynamic> json) =>
      _$CertificationFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationToJson(this);

  ///copyeith for updating about

  Certification copyWith({
    String? title,
    String? year,
    String? id,
  }) {
    return Certification(
      title: title ?? this.title,
      year: year ?? this.year,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Education {
  final String title;
  final String institute;
  final String year;
  final String id;

  Education({
    required this.title,
    required this.institute,
    required this.year,
    required this.id,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  ///copywith for updating about

  Education copyWith({
    String? title,
    String? institute,
    String? year,
    String? id,
  }) {
    return Education(
      title: title ?? this.title,
      institute: institute ?? this.institute,
      year: year ?? this.year,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class ProfessionalExperience {
  final String role;
  final String companyName;
  final String duration;
  final String description;
  final String id;

  ProfessionalExperience({
    required this.role,
    required this.companyName,
    required this.duration,
    required this.description,
    required this.id,
  });

  factory ProfessionalExperience.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionalExperienceToJson(this);

  ///copywith for updating about
  ProfessionalExperience copyWith({
    String? role,
    String? companyName,
    String? duration,
    String? description,
    String? id,
  }) {
    return ProfessionalExperience(
      role: role ?? this.role,
      companyName: companyName ?? this.companyName,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
