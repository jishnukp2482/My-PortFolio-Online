import 'package:potfolio/portfolio/data/remote/modals/response/project/orderid_availability_repsonse_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_delete_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/update_project_response_model.dart';

class ProjectState {
  final bool isLoading;
  final List<ProjectData>? projects;
  final ProjectDeleteResponseModel? deleteProjectResponseModal;
  final UpdateProjectResponseModel? updateProjectResponse;
  final UpdateProjectResponseModel? createProjectResponse;
  final UpdateProjectResponseModel? deleteProjectImgResponse;
  final OrderIdAvailabilityResponseModel? orderIdAvailabilityResponse;
  final String? errorMsg;
  ProjectState({
    required this.isLoading,
    this.projects,
    this.errorMsg,
    this.deleteProjectResponseModal,
    this.updateProjectResponse,
    this.deleteProjectImgResponse,
    this.createProjectResponse,
    this.orderIdAvailabilityResponse,
  });
  factory ProjectState.initial() => ProjectState(isLoading: false);
  ProjectState copyWith({
    bool? isLoading,
    List<ProjectData>? projects,

    String? errorMsg,
    ProjectDeleteResponseModel? deleteProjectResponseModal,
    UpdateProjectResponseModel? updateProjectResponse,
    UpdateProjectResponseModel? deleteProjectImgResponse,
    UpdateProjectResponseModel? createProjectResponse,
    OrderIdAvailabilityResponseModel? orderIdAvailabilityResponse,
  }) {
    return ProjectState(
      isLoading: isLoading ?? this.isLoading,
      projects: projects ?? this.projects,
      errorMsg: errorMsg ?? this.errorMsg,

      deleteProjectResponseModal:
          deleteProjectResponseModal ?? this.deleteProjectResponseModal,
      updateProjectResponse:
          updateProjectResponse ?? this.updateProjectResponse,
          deleteProjectImgResponse: deleteProjectImgResponse??this.deleteProjectImgResponse,
          createProjectResponse: createProjectResponse ??this.createProjectResponse,
          orderIdAvailabilityResponse: orderIdAvailabilityResponse??this.orderIdAvailabilityResponse,
    );
  }
}
