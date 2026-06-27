import 'package:dio/dio.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/download_resume_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'upload_resume_usecase.g.dart';
class UploadResumeUseCase {
  final AppRepository appRepository;

  UploadResumeUseCase(this.appRepository);
  Future<DownloadResumeResponseModel> build(MultipartFile file) async {
    return await appRepository.uploadResume(file);
  }
}

@riverpod
UploadResumeUseCase getUploadResumeUseCase(Ref ref) {
  final appRepository = ref.read(getAppRepositoryProvider);
  return UploadResumeUseCase(appRepository);
}
