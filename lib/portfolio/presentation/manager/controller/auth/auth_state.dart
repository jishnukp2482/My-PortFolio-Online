import 'package:potfolio/portfolio/data/remote/modals/response/auth/login_response_model.dart';

class AuthState {
  final bool isLoading;
  final LoginResponseModel? loginResponseModel;
  final String? errorMsg;

  AuthState({
    required this.isLoading,
    this.loginResponseModel,
    this.errorMsg,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    LoginResponseModel? loginResponseModel,
    String? errorMsg,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      loginResponseModel: loginResponseModel ?? this.loginResponseModel,
      errorMsg: errorMsg??this.errorMsg,
    );
  }
}
