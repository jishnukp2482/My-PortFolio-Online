import 'package:json_annotation/json_annotation.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';

part 'update_project_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateProjectResponseModel {
  final String message;

  final ProjectData data;

  UpdateProjectResponseModel({required this.message, required this.data});

  factory UpdateProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProjectResponseModelToJson(this);
}

