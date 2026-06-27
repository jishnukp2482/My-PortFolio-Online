import 'package:potfolio/portfolio/data/remote/modals/response/project/project_delete_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_project_usecase.g.dart';

class DeleteProjectUsecase {
  final AppRepository appRepository;

  DeleteProjectUsecase(this.appRepository);

  Future<ProjectDeleteResponseModel> build(String id) {
    return appRepository.deleteProject(id);
  }
}

@riverpod
DeleteProjectUsecase getDeleteProjectUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return DeleteProjectUsecase(appRepositroy);
}
