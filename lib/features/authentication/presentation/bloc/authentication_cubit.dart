import 'package:bloc/bloc.dart';

import '../../../../core/enums/status_enums.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/routes/apis_routes.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../../../core/utils/response_error_handler.dart';
import '../../../../core/utils/url_launcher.dart';
import '../../data/models/auth_params_model.dart';
import '../../data/models/resend_otp_params.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verify_otp_params.dart';
import '../../domain/usecases/usecases.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.registerUseCase,
    this.loginUseCase,
    this.forgotPasswordUseCase,
    this.verifyOTPUseCase,
    this.resetPasswordUseCase,
    this.resendOTPUseCase,
  ) : super(
        AuthenticationState(
          registerStatus: Status.initial,
          loginStatus: Status.initial,
          logoutStatus: Status.initial,
          forgotPasswordStatus: Status.initial,
          verifyOTPStatus: Status.initial,
          resetPasswordStatus: Status.initial,
          resendPasswordStatus: Status.initial,
        ),
      );

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyOTPUseCase verifyOTPUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final ResendOTPUseCase resendOTPUseCase;

  Future<void> register({
    required AuthParamsModel authParamModel,
    required Function(UserModel) onSuccess,
  }) async {
    emit(state.copyWith(registerStatus: Status.loading));
    final DataState dataState = await registerUseCase(authParamModel);

    if (dataState is DataFailed) {
      emit(state.copyWith(registerStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess(dataState.data);
      emit(state.copyWith(registerStatus: Status.success));
    }
  }

  Future<void> login({
    required AuthParamsModel authParamModel,
    required Function(UserModel) onSuccess,
  }) async {
    emit(state.copyWith(loginStatus: Status.loading));
    final DataState dataState = await loginUseCase(authParamModel);

    if (dataState is DataFailed) {
      emit(state.copyWith(loginStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess(dataState.data);
      emit(state.copyWith(loginStatus: Status.success));
    }
  }

  Future<void> forgotPassword({
    required String email,
    required Function onSuccess,
  }) async {
    emit(state.copyWith(forgotPasswordStatus: Status.loading));
    final DataState dataState = await forgotPasswordUseCase(email);

    if (dataState is DataFailed) {
      emit(state.copyWith(forgotPasswordStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess();
      emit(state.copyWith(forgotPasswordStatus: Status.success));
    }
  }

  Future<void> verifyOTP({
    required VerifyOTPParams params,
    required Function onSuccess,
  }) async {
    emit(state.copyWith(verifyOTPStatus: Status.loading));
    final DataState dataState = await verifyOTPUseCase(params);

    if (dataState is DataFailed) {
      emit(state.copyWith(verifyOTPStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess();
      emit(state.copyWith(verifyOTPStatus: Status.success));
    }
  }

  Future<void> resetPassword({
    required ResetPasswordParams params,
    required Function onSuccess,
  }) async {
    emit(state.copyWith(resetPasswordStatus: Status.loading));
    final DataState dataState = await resetPasswordUseCase(params);

    if (dataState is DataFailed) {
      emit(state.copyWith(resetPasswordStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess();
      emit(state.copyWith(resetPasswordStatus: Status.success));
    }
  }

  Future<void> resendOtp({
    required ResendOTPParams resendOTPParams,
    required Function onSuccess,
  }) async {
    emit(state.copyWith(resendPasswordStatus: Status.loading));
    final DataState dataState = await resendOTPUseCase(resendOTPParams);

    if (dataState is DataFailed) {
      emit(state.copyWith(resendPasswordStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      onSuccess();
      emit(state.copyWith(resendPasswordStatus: Status.success));
    }
  }

  Future<void> authWithGoogle({required Function onSuccess}) async {
    try {
      launchURL(Routes.baseUrl + Routes.authWithGoogle);
    } catch (e) {
      showSnackBar(
        responseErrorHandler(error: e),
        snackBarType: SnackBarType.error,
      );
    }
  }
}
