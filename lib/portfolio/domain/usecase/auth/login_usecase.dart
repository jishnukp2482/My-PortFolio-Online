import 'package:potfolio/portfolio/data/remote/modals/request/auth/login_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/auth/login_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_usecase.g.dart';
class LoginUsecase {
  final AppRepository appRepository;

  LoginUsecase(this.appRepository);
  Future<LoginResponseModel> build(LoginRequestModel loginRequestModel) {
    return appRepository.getLogin(loginRequestModel);
  }
}
@riverpod
LoginUsecase getLoginUseCase(Ref ref) {
  final getAppRepository = ref.read(getAppRepositoryProvider);
  return LoginUsecase(getAppRepository);
}
