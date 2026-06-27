import 'package:json_annotation/json_annotation.dart';

part 'project_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectResponseModel {
  final String message;

  @JsonKey(defaultValue: [])
  final List<ProjectData> data;

  ProjectResponseModel({required this.message, required this.data});

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProjectData {
  final String projectName;
  final bool show;
  final int order;
  final String subDescription;
  final String projectDescription;

  @JsonKey(defaultValue: [])
  final List<ProjectImage> imgUrls;

  @JsonKey(defaultValue: [])
  final List<KeyFeature> keyFeatures;

  @JsonKey(defaultValue: [])
  final List<ProjectTechnology> technologies;

  @JsonKey(defaultValue: [])
  final List<PublishOn> publishOn;

  final String defaultPublishOnDescription;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;

  ProjectData({
    required this.projectName,
    required this.show,
    required this.order,
    required this.subDescription,
    required this.projectDescription,
    required this.imgUrls,
    required this.keyFeatures,
    required this.technologies,
    required this.publishOn,
    required this.defaultPublishOnDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);
}

@JsonSerializable()
class ProjectImage {
  final String imgUrl;
  final String publicId;
  final String id;

  ProjectImage({
    required this.imgUrl,
    required this.publicId,
    required this.id,
  });

  factory ProjectImage.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectImageToJson(this);
}

@JsonSerializable()
class KeyFeature {
  final String feature;
  final String id;

  KeyFeature({required this.feature, required this.id});

  factory KeyFeature.fromJson(Map<String, dynamic> json) =>
      _$KeyFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$KeyFeatureToJson(this);
}

@JsonSerializable()
class ProjectTechnology {
  final String description;
  final String technologies;
  final String id;

  ProjectTechnology({
    required this.description,
    required this.technologies,
    required this.id,
  });

  factory ProjectTechnology.fromJson(Map<String, dynamic> json) =>
      _$ProjectTechnologyFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTechnologyToJson(this);
}

@JsonSerializable()
class PublishOn {
  final String platform;
  final String url;
  final String id;

  PublishOn({required this.platform, required this.url, required this.id});

  factory PublishOn.fromJson(Map<String, dynamic> json) =>
      _$PublishOnFromJson(json);

  Map<String, dynamic> toJson() => _$PublishOnToJson(this);
}
