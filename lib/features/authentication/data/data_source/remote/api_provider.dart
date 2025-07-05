import 'package:dio/dio.dart';

import '../../../../../core/routes/apis_routes.dart';
import '../../../../../core/utils/general_api.dart';
import '../../models/auth_params_model.dart';
import '../../models/resend_otp_params.dart';
import '../../models/reset_password_params.dart';
import '../../models/user_model.dart';
import '../../models/verify_otp_params.dart';
import '../local/auth_storage.dart';


class AuthenticationApiProvider {
  final AuthStorage authStorage = AuthStorage();

  Future<Response> register(final AuthParamsModel params) async {
    final Response result = await generalApi(
      method: 'post',
      url: Routes.register,
      data: params.toJsonForRegister(),
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> login(final AuthParamsModel params) async {
    final Response result = await generalApi(
      method: 'post',
      url: Routes.login,
      data: params.toJsonForLogin(),
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> logout() async {
    final Response result = await generalApi(
      method: 'get',
      url: Routes.logout,
      header: {'Authorization': await authStorage.getToken()},
    );
    authStorage.clearToken();
    return result;
  }

  Future<Response> forgotPassword(final String email) async {
    final Response result = await generalApi(
      method: 'post',
      url: Routes.forgotPassword,
      data: {'email': email},
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> verifyOTP(final VerifyOTPParams params) async {
    final Response result = await generalApi(
      method: 'post',
      url:
          params.otpVerificationType == OTPVerificationType.register ||
                  params.otpVerificationType == OTPVerificationType.login
              ? Routes.verifyRegisterOTP
              : Routes.verifyResetPasswordOTP,
      data: params.toJson(),
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> resetPassword(final ResetPasswordParams params) async {
    final Response result = await generalApi(
      method: 'post',
      url: Routes.resetPassword,
      data: params.toJson(),
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> resendOTP(final ResendOTPParams params) async {
    final Response result = await generalApi(
      method: 'post',
      url:
          params.otpVerificationType == OTPVerificationType.forgotPassword
              ? Routes.resendPasswordResetOTP
              : Routes.resendEmailVerificationOTP,
      data: params.toJson(),
      isLogin: true,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> getProfile() async {
    final Response result = await generalApi(
      method: 'get',
      url: Routes.userProfile,
      returnResponseOnError: true,
    );
    return result;
  }

  Future<Response> updateProfile(final UserModel userModel) async {
    final Response result = await generalApi(
      method: 'put',
      url: Routes.userProfile,
      data:
          userModel.pictureVarForUpload == null
              ? userModel.toJson()
              : await userModel.toMultipartJson(),
      header: {'Authorization': await authStorage.getToken()},
      returnResponseOnError: true,
    );
    return result;
  }
}
