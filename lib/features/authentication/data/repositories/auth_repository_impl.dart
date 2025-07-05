import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/response_error_handler.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/local/auth_storage.dart';
import '../data_source/remote/api_provider.dart';
import '../models/auth_params_model.dart';
import '../models/resend_otp_params.dart';
import '../models/reset_password_params.dart';
import '../models/user_model.dart';
import '../models/verify_otp_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthenticationApiProvider apiProvider;

  AuthRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<UserModel>> register(AuthParamsModel params) async {
    try {
      final Response response = await apiProvider.register(params);

      if (response.statusCode == 201) {
        AuthStorage().saveToken(response.data['access_token']);
        AuthStorage().saveEmailVerificationStatus(
          response.data['user']['isEmailVerified'],
        );
        return DataSuccess(UserModel.fromJson(response.data['user']));
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<UserModel>> login(AuthParamsModel params) async {
    try {
      final Response response = await apiProvider.login(params);

      if (response.statusCode == 201) {
        AuthStorage().saveToken(response.data['access_token']);
        AuthStorage().saveEmailVerificationStatus(
          response.data['user']['isEmailVerified'],
        );
        return DataSuccess(UserModel.fromJson(response.data['user']));
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<bool>> logout() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<DataState<bool>> resendOTP(final ResendOTPParams params) async {
    try {
      final Response response = await apiProvider.resendOTP(params);

      if (response.statusCode == 201) {
        return DataSuccess(true);
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<bool>> forgotPassword(String email) async {
    try {
      final Response response = await apiProvider.forgotPassword(email);

      if (response.statusCode == 201) {
        return DataSuccess(true);
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<bool>> verifyOTP(VerifyOTPParams params) async {
    try {
      final Response response = await apiProvider.verifyOTP(params);

      if (response.statusCode == 201) {
        return DataSuccess(true);
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<bool>> resetPassword(ResetPasswordParams params) async {
    try {
      final Response response = await apiProvider.resetPassword(params);

      if (response.statusCode == 201) {
        return DataSuccess(true);
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<UserModel>> getProfile() async {
    try {
      final Response response = await apiProvider.getProfile();

      if (response.statusCode == 200) {
        return DataSuccess(UserModel.fromJson(response.data['user']));
      } else {
        return DataFailed(response.data['message']);
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<bool>> updateProfile(UserModel params) async {
    try {
      final Response response = await apiProvider.updateProfile(params);

      if (response.statusCode == 200) {
        return DataSuccess(true);
      } else {
        return DataFailed(serverErrorMessageHandler(response.data['message']));
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }
}
