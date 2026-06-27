import 'package:json_annotation/json_annotation.dart';

part 'project_delete_response_model.g.dart';

@JsonSerializable()
class ProjectDeleteResponseModel {
  final String message;

  ProjectDeleteResponseModel({required this.message});

  factory ProjectDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDeleteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDeleteResponseModelToJson(this);
}
