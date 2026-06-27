import 'package:potfolio/portfolio/data/remote/modals/request/about/update_about_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update_about_usecase.g.dart';

class UpdateAboutUseCase {
  final AppRepository appRepository;

  UpdateAboutUseCase(this.appRepository);
  Future<AboutResponseModel> build(UpdateAboutRequestModel requestModal) async {
    return await appRepository.updateAbout(requestModal);
  }
}

@riverpod
UpdateAboutUseCase getUpdateAboutUseCase(Ref ref) {
  final appRepository = ref.read(getAppRepositoryProvider);
  return UpdateAboutUseCase(appRepository);
}
