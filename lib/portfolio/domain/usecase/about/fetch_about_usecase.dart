import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_about_usecase.g.dart';
class FetchAboutUsecase {
  final AppRepository appRepository;

  FetchAboutUsecase(this.appRepository);
  Future<AboutResponseModel> build() async {
    return await appRepository.fetchAbout();
  }
}

@riverpod
FetchAboutUsecase getFetchAboutUsecase(Ref ref) {
  final apprepository = ref.read(getAppRepositoryProvider);
  return FetchAboutUsecase(apprepository);
}
