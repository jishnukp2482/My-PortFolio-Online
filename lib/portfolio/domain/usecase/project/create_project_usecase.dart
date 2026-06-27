import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/project/create_project_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/update_project_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_project_usecase.g.dart';
class CreateProjectUsecase {
  final AppRepository appRepository;

  CreateProjectUsecase(this.appRepository);

  Future<UpdateProjectResponseModel> build(
    CreateProjectRequestModel requestModal,
  ) {
    return appRepository.createProject(requestModal);
  }
}

@riverpod
CreateProjectUsecase getCreateProjectUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return CreateProjectUsecase(appRepositroy);
}
