import 'package:get_storage/get_storage.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/auth/login_request_model.dart';
import 'package:potfolio/portfolio/domain/usecase/auth/login_usecase.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/auth/auth_state.dart';
import 'package:potfolio/portfolio/presentation/routes/LocalStorageNames.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  final getStorage = GetStorage();
  @override
  AuthState build() => AuthState.initial();

  Future<void> getLogin(LoginRequestModel requestModel) async {
    state = state.copyWith(isLoading: true, errorMsg: null);
    try {
      final loginUsecase = ref.read(getLoginUseCaseProvider);
      var result = await loginUsecase.build(requestModel);
      state = state.copyWith(loginResponseModel: result, isLoading: false);
      getStorage.write(
          LocalStorageKeys.accessTokenKEY, result.data.accessToken);
      getStorage.write(
          LocalStorageKeys.refreshTokenKEY, result.data.refreshToken);
    } catch (e) {
      errorPrint("login failed $e");
      state = state.copyWith(
        loginResponseModel: null,
        isLoading: false,
        errorMsg: "Invalid username or password",
      );
    }
  }
}
