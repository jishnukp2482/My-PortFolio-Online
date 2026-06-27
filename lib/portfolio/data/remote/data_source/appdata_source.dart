import 'package:dio/dio.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/about/update_about_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/auth/login_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/contacts/create_contact_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/project/create_project_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/download_resume_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/auth/login_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/orderid_availability_repsonse_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_delete_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/update_project_response_model.dart';
import 'package:potfolio/portfolio/data/services/api_client.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "appdata_source.g.dart";

abstract class AppDataSource {
  Future<LoginResponseModel> getLogin(LoginRequestModel requestModel);
  Future<DownloadResumeResponseModel> downloadResume();
  Future<AllContactsResponseModel> fetchAllContacts();
  Future<AboutResponseModel> fetchAbout();
  Future<ProjectResponseModel> fetchProjects();

  ///Admin
  Future<AboutResponseModel> updateAbout(UpdateAboutRequestModel requestModal);
  Future<DownloadResumeResponseModel> uploadResume(MultipartFile file);
  Future<CreateContactResponseModel> createContact(
    CreateContactRequestModel requestModal,
  );
  Future<CreateContactResponseModel> updateContact(
    CreateContactRequestModel requestModal,
  );
  Future<CreateContactResponseModel> deleteContact(String id);
  Future<UpdateProjectResponseModel> createProject(
    CreateProjectRequestModel requestModal,
  );

  Future<UpdateProjectResponseModel> updateProject(
    CreateProjectRequestModel requestModal,
  );
  Future<ProjectDeleteResponseModel> deleteProject(String id);
  Future<UpdateProjectResponseModel> deleteProjectImg(
    String projectID,
    String publicId,
  );
  Future<OrderIdAvailabilityResponseModel> checkOrderIDAvialbality(
    int orderID,
    String projectID,
  );
}

class AppdataSourceImpl extends AppDataSource {
  final ApiClient apiClient;

  AppdataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> getLogin(LoginRequestModel requestModel) {
    return apiClient.getLogin(requestModel);
  }

  @override
  Future<DownloadResumeResponseModel> downloadResume() {
    return apiClient.downloadResume();
  }

  @override
  Future<AllContactsResponseModel> fetchAllContacts() {
    return apiClient.fetchAllContacts();
  }

  @override
  Future<AboutResponseModel> fetchAbout() {
    return apiClient.fetchAbout();
  }

  @override
  Future<ProjectResponseModel> fetchProjects() {
    return apiClient.fetchProjects();
  }

  @override
  Future<AboutResponseModel> updateAbout(UpdateAboutRequestModel requestModal) {
    return apiClient.updateAbout(requestModal);
  }

  @override
  Future<DownloadResumeResponseModel> uploadResume(MultipartFile file) {
    return apiClient.uploadResume(file);
  }

  @override
  Future<CreateContactResponseModel> createContact(
    CreateContactRequestModel requestModal,
  ) {
    return apiClient.createContact(
      requestModal.title,
      requestModal.url,

      requestModal.img,
      requestModal.order,
    );
  }

  @override
  Future<CreateContactResponseModel> deleteContact(String id) {
    return apiClient.deleteContact(id);
  }

  @override
  Future<CreateContactResponseModel> updateContact(
    CreateContactRequestModel requestModal,
  ) {
    return apiClient.updateContact(
      requestModal.id ?? "",
      requestModal.title,
      requestModal.url,
      requestModal.img,
      requestModal.order,
    );
  }

  @override
  Future<UpdateProjectResponseModel> createProject(
    CreateProjectRequestModel requestModal,
  ) {
    final data = buildProjectRequest(requestModal);
    return apiClient.createProject(
      data["id"],
      data["projectName"],
      data["show"],
      data["order"],
      data["subDescription"],
      data["projectDescription"],
      data["defaultPublishOnDescription"],
      data["keyFeatures"],
      data["technologies"],
      data["publishOn"],
      requestModal.images,
    );
  }

  @override
  Future<ProjectDeleteResponseModel> deleteProject(String id) {
    return apiClient.deleteProject(id ?? "");
  }

  @override
  Future<UpdateProjectResponseModel> updateProject(
    CreateProjectRequestModel requestModal,
  ) {
    final data = buildProjectRequest(requestModal);
    alertPrint("data = $data");
    return apiClient.updateProject(
      data["id"],
      data["projectName"],
      data["show"],
      data["order"],
      data["subDescription"],
      data["projectDescription"],
      data["defaultPublishOnDescription"],
      data["keyFeatures"],
      data["technologies"],
      data["publishOn"],
      requestModal.images,
    );
  }

  @override
  Future<UpdateProjectResponseModel> deleteProjectImg(
    String projectId,
    String publicId,
  ) {
    return apiClient.deleteProjectImg(projectId, publicId);
  }

  @override
  Future<OrderIdAvailabilityResponseModel> checkOrderIDAvialbality(
    int orderID,
     String projectID,
  ) {
    return apiClient.checkOrderIDAvialbality(orderID,projectID);
  }
}

@riverpod
AppDataSource getAppDataSource(Ref ref) {
  final apiClient = ref.read(getApiClientProvider);
  return AppdataSourceImpl(apiClient);
}
