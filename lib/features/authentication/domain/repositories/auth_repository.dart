import '../../../../core/resources/data_state.dart';
import '../../data/models/auth_params_model.dart';
import '../../data/models/resend_otp_params.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verify_otp_params.dart';

abstract class AuthRepository {
  Future<DataState<UserModel>> register(AuthParamsModel params);

  Future<DataState<UserModel>> login(AuthParamsModel params);

  Future<DataState<bool>> logout();

  Future<DataState<bool>> forgotPassword(String email);

  Future<DataState<bool>> verifyOTP(VerifyOTPParams params);

  Future<DataState<bool>> resetPassword(ResetPasswordParams params);

  Future<DataState<bool>> resendOTP(ResendOTPParams params);

  Future<DataState<UserModel>> getProfile();

  Future<DataState<bool>> updateProfile(UserModel params);
}
