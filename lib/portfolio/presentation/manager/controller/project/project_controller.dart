import 'package:potfolio/portfolio/data/remote/modals/request/project/create_project_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/orderid_availability_repsonse_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/domain/usecase/project/check_orderid_availability_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/project/create_project_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/project/delete_project_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/project/project_img_delete_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/project/projects_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/project/update_project_usecase.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_state.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_controller.g.dart';

@riverpod
class ProjectController extends _$ProjectController {
  @override
  ProjectState build() {
    Future.microtask(fetchProjects);
    return ProjectState.initial();
  }

  Future<void> fetchProjects() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchProjectUseCase = ref.read(getProjectUseCaseProvider);
      var result = await fetchProjectUseCase.build();
      state = state.copyWith(projects: result.data);
    } catch (e) {
      errorPrint("projects fetch failed = $e");
      state = state.copyWith(projects: [], errorMsg: "Project Fetching Failed");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> createProject(CreateProjectRequestModel reqModal) async {
    warningPrint("reqmodal = ${reqModal.toJson()}");
    state = state.copyWith(isLoading: true);
    try {
      final createProjectUseCase = ref.read(getCreateProjectUsecaseProvider);
      var result = await createProjectUseCase.build(reqModal);
      final updatedProject = result.data;
      final List<ProjectData> updatedProjects = [
        ...(state.projects ?? <ProjectData>[]),
        updatedProject,
      ];
      state = state.copyWith(
        createProjectResponse: result,
        projects: updatedProjects,
      );
    } catch (e) {
      errorPrint("create Project failed = $e");
      state = state.copyWith(
        createProjectResponse: null,
        errorMsg: "Project Creation Failed",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateProject(CreateProjectRequestModel reqModal) async {
    customPrint("reqmodal Project = ${reqModal.toJson()}");
    state = state.copyWith(isLoading: true);
    try {
      final updateProjectUseCase = ref.read(getUpdateProjectUsecaseProvider);
      var result = await updateProjectUseCase.build(reqModal);

      final updatedProject = result.data;

      final updatedProjects = state.projects?.map((e) {
        if (e.id == updatedProject.id) {
          return updatedProject;
        }
        return e;
      }).toList();
      state = state.copyWith(
        updateProjectResponse: result,
        projects: updatedProjects,
      );
    } catch (e) {
      errorPrint("update Project failed = e");
      state = state.copyWith(
        updateProjectResponse: null,
        errorMsg: "Update Project Failed",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteProject(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final deleteProjectUseCase = ref.read(getDeleteProjectUsecaseProvider);
      var result = await deleteProjectUseCase.build(id);
      final updatedProjects = state.projects
          ?.where((element) => element.id != id)
          .toList();
      state = state.copyWith(
        deleteProjectResponseModal: result,
        projects: updatedProjects,
      );
    } catch (e) {
      errorPrint("delete Project failed = $e");
      state = state.copyWith(
        deleteProjectResponseModal: null,
        errorMsg: "Project Deletion Failed",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteProjectImg(String projectId, String publicId) async {
    state = state.copyWith(isLoading: true);
    try {
      final deleteProjectImgUseCase = ref.read(
        getDeleteProjectImgUsecaseProvider,
      );
      var result = await deleteProjectImgUseCase.build(projectId, publicId);

      state = state.copyWith(deleteProjectImgResponse: result);
    } catch (e) {
      errorPrint("delete Project Img failed = $e");
      state = state.copyWith(
        deleteProjectImgResponse: null,
        errorMsg: "Image Deletion Failed",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void clearMessages() {
    state = state.copyWith(
      errorMsg: null,
      updateProjectResponse: null,
      deleteProjectImgResponse: null,
      deleteProjectResponseModal: null,
      orderIdAvailabilityResponse: null,
    );
  }

  Future<OrderIdAvailabilityResponseModel?> checkOrderIDAvailability(
    int orderID,
     String projectID,
  ) async {
    try {
      final orderIDUseCase = ref.read(
        getCheckOrderIDAvailabilityUsecaseProvider,
      );
      var result = await orderIDUseCase.build(orderID,projectID);

      state = state.copyWith(orderIdAvailabilityResponse: result);
      return result;
    } catch (e) {
      errorPrint("check orderID failed = $e");
      state = state.copyWith(
        orderIdAvailabilityResponse: null,
        errorMsg: "order ID  checking Failed",
      );
      return null;
    }
  }
}
