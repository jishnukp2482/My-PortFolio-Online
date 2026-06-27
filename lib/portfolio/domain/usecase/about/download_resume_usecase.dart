import 'package:potfolio/portfolio/data/remote/modals/response/about/download_resume_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'download_resume_usecase.g.dart';
class DownloadResumeUseCase {
  final AppRepository appRepository;

  DownloadResumeUseCase(this.appRepository);
  Future<DownloadResumeResponseModel> build() async {
    return await appRepository.downloadResume();
  }
}

@riverpod
DownloadResumeUseCase getDownloadUsecase(Ref ref) {
  final appRepository = ref.read(getAppRepositoryProvider);
  return DownloadResumeUseCase(appRepository);
}
