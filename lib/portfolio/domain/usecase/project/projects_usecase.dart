import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'projects_usecase.g.dart';

class ProjectsUsecase {
  final AppRepository appRepository;

  ProjectsUsecase(this.appRepository);
  Future<ProjectResponseModel> build() async {
    return appRepository.fetchProjects();
  }
}
@riverpod
ProjectsUsecase getProjectUseCase(Ref ref) {
  final appRespositroy = ref.read(getAppRepositoryProvider);
  return ProjectsUsecase(appRespositroy);
}
