

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/auth_params_model.dart';
import '../../data/models/resend_otp_params.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/user_model.dart';
import '../../data/models/verify_otp_params.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<DataState<UserModel>> call(AuthParamsModel params) async {
    return await repository.register(params);
  }
}

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<DataState<UserModel>> call(AuthParamsModel params) async {
    return await repository.login(params);
  }
}

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<DataState<bool>> call(NoParams params) async {
    return await repository.logout();
  }
}

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<DataState<bool>> call(String email) async {
    return await repository.forgotPassword(email);
  }
}

class VerifyOTPUseCase {
  final AuthRepository repository;

  VerifyOTPUseCase(this.repository);

  Future<DataState<bool>> call(VerifyOTPParams params) async {
    return await repository.verifyOTP(params);
  }
}

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<DataState<bool>> call(ResetPasswordParams params) async {
    return await repository.resetPassword(params);
  }
}

class ResendOTPUseCase {
  final AuthRepository repository;

  ResendOTPUseCase(this.repository);

  Future<DataState<bool>> call(ResendOTPParams params) async {
    return await repository.resendOTP(params);
  }
}

class GetProfileUseCase {
  final AuthRepository repository;

  GetProfileUseCase(this.repository);

  Future<DataState<UserModel>> call() async {
    return await repository.getProfile();
  }
}

class UpdateProfileUseCase {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<DataState<bool>> call(UserModel params) async {
    return await repository.updateProfile(params);
  }
}
