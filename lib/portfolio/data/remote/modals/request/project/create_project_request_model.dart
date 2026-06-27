import 'dart:convert';

import 'package:dio/dio.dart';

class CreateProjectRequestModel {
  final String? id;
  final String projectName;
  final bool show;
  final int order;
  final String subDescription;
  final String projectDescription;
  final List<MultipartFile> images;
  final List<CreateKeyFeatures> keyFeatures;
  final List<CreateProjectTechonlogies> technologies;
  final String defaultPublishOnDescription;
  final List<CreatePublishOn> publishOn;

  CreateProjectRequestModel({
    this.id,
    required this.projectName,
    required this.show,
    required this.order,
    required this.subDescription,
    required this.projectDescription,
    required this.images,
    required this.keyFeatures,
    required this.technologies,
    required this.defaultPublishOnDescription,
    required this.publishOn,
  });
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "projectName": projectName,
      "show": show,
      "subDescription": subDescription,
      "projectDescription": projectDescription,
      "imagesCount": images.length,
      "defaultPublishOnDescription": defaultPublishOnDescription,
      "keyFeatures": keyFeatures.map((e) => e.toJson()).toList(),
      "technologies": technologies.map((e) => e.toJson()).toList(),
      "publishOn": publishOn.map((e) => e.toJson()).toList(),
    };
  }
}

class CreateProjectTechonlogies {
  final String technologies;
  final String description;

  CreateProjectTechonlogies(this.technologies, this.description);
  Map<String, dynamic> toJson() {
    return {"technologies": technologies, "description": description};
  }
}

class CreateKeyFeatures {
  final String feature;

  CreateKeyFeatures(this.feature);
  Map<String, dynamic> toJson() {
    return {"feature": feature};
  }
}

class CreatePublishOn {
  final String platform;
  final String url;
  CreatePublishOn(this.platform, this.url);
  Map<String, dynamic> toJson() {
    return {"platform": platform, "url": url};
  }
}

Map<String, dynamic> buildProjectRequest(CreateProjectRequestModel model) {
  final keyFeaturesJson = jsonEncode(
    model.keyFeatures.map((e) => {"feature": e.feature}).toList(),
  );

  final technologiesJson = jsonEncode(
    model.technologies
        .map(
          (e) => {"technologies": e.technologies, "description": e.description},
        )
        .toList(),
  );

  final publishOnJson = jsonEncode(
    model.publishOn.map((e) => {"platform": e.platform, "url": e.url}).toList(),
  );
  return {
    "id": model.id,
    "projectName": model.projectName,
    "show": model.show,
    "order": model.order,
    "subDescription": model.subDescription,
    "projectDescription": model.projectDescription,
    "defaultPublishOnDescription": model.defaultPublishOnDescription,
    "keyFeatures": keyFeaturesJson,
    "technologies": technologiesJson,
    "publishOn": publishOnJson,
  };
}
