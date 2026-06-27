

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

abstract class AppRepository {
  Future<LoginResponseModel> getLogin(LoginRequestModel requestModel);
    Future<DownloadResumeResponseModel> downloadResume();
    Future<AllContactsResponseModel> fetchAllContacts();
      Future<AboutResponseModel> fetchAbout();
      Future<ProjectResponseModel> fetchProjects();
       Future<AboutResponseModel> updateAbout(UpdateAboutRequestModel requestModal);
         Future<DownloadResumeResponseModel> uploadResume(MultipartFile file);
          Future<CreateContactResponseModel> createContact(
      CreateContactRequestModel requestModal);
  Future<CreateContactResponseModel> updateContact(
      CreateContactRequestModel requestModal);
  Future<CreateContactResponseModel> deleteContact(String id);
    Future<UpdateProjectResponseModel> createProject(
    CreateProjectRequestModel requestModal,
  );
    Future<UpdateProjectResponseModel> updateProject(
    CreateProjectRequestModel requestModal,
  );
  Future<ProjectDeleteResponseModel> deleteProject(
    String id,
  );
    Future<UpdateProjectResponseModel> deleteProjectImg(
    String projectID,
    String publicId,
  );
    Future<OrderIdAvailabilityResponseModel> checkOrderIDAvialbality(int orderID,
    String projectID,
  );

}