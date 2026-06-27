import 'package:dio/dio.dart';
import 'package:potfolio/portfolio/core/constants/api_constants.dart';
import 'package:potfolio/portfolio/core/network/dio_provider.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/about/update_about_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/auth/login_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/download_resume_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/auth/login_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/orderid_availability_repsonse_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_delete_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/update_project_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @POST(ApiConstants.signin)
  Future<LoginResponseModel> getLogin(@Body() LoginRequestModel requestModel);
  @GET(ApiConstants.downLoadResume)
  Future<DownloadResumeResponseModel> downloadResume();
  @GET(ApiConstants.fetchContacts)
  Future<AllContactsResponseModel> fetchAllContacts();
  @GET(ApiConstants.fetchAbout)
  Future<AboutResponseModel> fetchAbout();
  @GET(ApiConstants.fetchProjects)
  Future<ProjectResponseModel> fetchProjects();

  ///Admin
  @PUT(ApiConstants.updateAbout)
  Future<AboutResponseModel> updateAbout(
    @Body() UpdateAboutRequestModel requestModal,
  );

  @POST(ApiConstants.uploadReusme)
  @MultiPart()
  Future<DownloadResumeResponseModel> uploadResume(
    @Part(name: "resume") MultipartFile file,
  );

  @POST(ApiConstants.createContact)
  @MultiPart()
  Future<CreateContactResponseModel> createContact(
    @Part(name: "title") String title,
    @Part(name: "url") String url,
    @Part(name: "img") MultipartFile? file,
    @Part(name: "order") String order,
  );
  @PUT("${ApiConstants.updateContact}/{id}")
  @MultiPart()
  Future<CreateContactResponseModel> updateContact(
    @Path("id") String id,
    @Part(name: "title") String title,
    @Part(name: "url") String url,
    @Part(name: "img") MultipartFile? file,
    @Part(name: "order") String order,
  );
  @DELETE("${ApiConstants.deleteContact}/{id}")
  Future<CreateContactResponseModel> deleteContact(@Path("id") String id);

  @POST(ApiConstants.createproject)
  @MultiPart()
  Future<UpdateProjectResponseModel> createProject(
    @Path("id") String id,
    @Part(name: "projectName") String projectName,
    @Part(name: "show") bool show,
    @Part(name: "order") int order,
    @Part(name: "subDescription") String subDescription,
    @Part(name: "projectDescription") String projectDescription,
    @Part(name: "defaultPublishOnDescription")
    String defaultPublishOnDescription,
    @Part(name: "keyFeatures") String keyFeatures,
    @Part(name: "technologies") String technologies,
    @Part(name: "publishOn") String publishOn,
    @Part(name: "images") List<MultipartFile>? images,
  );

  @DELETE("${ApiConstants.deleteproject}/{id}")
  Future<ProjectDeleteResponseModel> deleteProject(@Path("id") String id);
  @PUT("${ApiConstants.updateproject}/{id}")
  @MultiPart()
  Future<UpdateProjectResponseModel> updateProject(
    @Path("id") String id,
    @Part(name: "projectName") String projectName,
    @Part(name: "show") bool show,
    @Part(name: "order") int order,
    @Part(name: "subDescription") String subDescription,
    @Part(name: "projectDescription") String projectDescription,
    @Part(name: "defaultPublishOnDescription")
    String defaultPublishOnDescription,
    @Part(name: "keyFeatures") String keyFeatures,
    @Part(name: "technologies") String technologies,
    @Part(name: "publishOn") String publishOn,
    @Part(name: "images") List<MultipartFile>? images,
  );

  @DELETE("${ApiConstants.deleteProjectImg}/{id}")
  Future<UpdateProjectResponseModel> deleteProjectImg(
    @Path("id") String id,
    @Query("publicId") String publicId,
  );
  @GET(ApiConstants.orderIDAvailability)
  Future<OrderIdAvailabilityResponseModel> checkOrderIDAvialbality(
    @Query("orderID") int orderID,
    @Query("projectID") String? projectID,
  );
}

@riverpod
ApiClient getApiClient(Ref ref) {
  final dioprovider = ref.read(getDioProviderProvider);
  return ApiClient(dioprovider.dio);
}
