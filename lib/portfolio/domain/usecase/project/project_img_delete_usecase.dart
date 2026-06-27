import 'package:potfolio/portfolio/data/remote/modals/response/project/update_project_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_img_delete_usecase.g.dart';

class DeleteProjectImgUsecase {
  final AppRepository appRepository;

  DeleteProjectImgUsecase(this.appRepository);

  Future<UpdateProjectResponseModel> build(String projectId, String publicId) {
    return appRepository.deleteProjectImg(projectId, publicId);
  }
}

@riverpod
DeleteProjectImgUsecase getDeleteProjectImgUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return DeleteProjectImgUsecase(appRepositroy);
}
