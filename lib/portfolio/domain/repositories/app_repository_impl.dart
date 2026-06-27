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
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/remote/data_source/appdata_source.dart';
import '../../data/repository/app_repository.dart';
part 'app_repository_impl.g.dart';

class AppRepositoryimpl extends AppRepository {
  final AppDataSource appDataSource;

  AppRepositoryimpl(this.appDataSource);

  @override
  Future<LoginResponseModel> getLogin(LoginRequestModel requestModel) async {
    return await appDataSource.getLogin(requestModel);
  }

  @override
  Future<DownloadResumeResponseModel> downloadResume() async {
    return await appDataSource.downloadResume();
  }

  @override
  Future<AllContactsResponseModel> fetchAllContacts() async {
    return await appDataSource.fetchAllContacts();
  }

  @override
  Future<AboutResponseModel> fetchAbout() async {
    return await appDataSource.fetchAbout();
  }

  @override
  Future<ProjectResponseModel> fetchProjects() async {
    return await appDataSource.fetchProjects();
  }

  @override
  Future<AboutResponseModel> updateAbout(
    UpdateAboutRequestModel requestModal,
  ) async {
    return await appDataSource.updateAbout(requestModal);
  }

  @override
  Future<DownloadResumeResponseModel> uploadResume(MultipartFile file) async {
    return await appDataSource.uploadResume(file);
  }

  @override
  Future<CreateContactResponseModel> createContact(
    CreateContactRequestModel requestModal,
  ) async {
    return await appDataSource.createContact(requestModal);
  }

  @override
  Future<CreateContactResponseModel> deleteContact(String id) async {
    return await appDataSource.deleteContact(id);
  }

  @override
  Future<CreateContactResponseModel> updateContact(
    CreateContactRequestModel requestModal,
  ) async {
    return await appDataSource.updateContact(requestModal);
  }

  @override
  Future<UpdateProjectResponseModel> createProject(
    CreateProjectRequestModel requestModal,
  ) async {
    return await appDataSource.createProject(requestModal);
  }

  @override
  Future<ProjectDeleteResponseModel> deleteProject(String id) async {
    return await appDataSource.deleteProject(id);
  }

  @override
  Future<UpdateProjectResponseModel> updateProject(
    CreateProjectRequestModel requestModal,
  ) async {
    return await appDataSource.updateProject(requestModal);
  }

  @override
  Future<UpdateProjectResponseModel> deleteProjectImg(
    String projectID,
    String publicId,
  ) async {
    return await appDataSource.deleteProjectImg(projectID, publicId);
  }

  @override
  Future<OrderIdAvailabilityResponseModel> checkOrderIDAvialbality(
    int orderID,
     String projectID,
  ) async {
    return await appDataSource.checkOrderIDAvialbality(orderID,projectID);
  }
}

@riverpod
AppRepository getAppRepository(Ref ref) {
  final getAppDataSource = ref.read(getAppDataSourceProvider);
  return AppRepositoryimpl(getAppDataSource);
}
