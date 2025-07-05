import '../../features/authentication/data/data_source/remote/api_provider.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/usecases/usecases.dart';
import '../../features/authentication/presentation/bloc/authentication_cubit.dart';

import 'locator.dart';

Future<void> setupAuthenticationLocators() async {
  locator.registerSingleton<AuthenticationApiProvider>(
    AuthenticationApiProvider(),
  );

  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  locator.registerSingleton<RegisterUseCase>(RegisterUseCase(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));

  locator.registerSingleton<ForgotPasswordUseCase>(
    ForgotPasswordUseCase(locator()),
  );
  locator.registerSingleton<VerifyOTPUseCase>(VerifyOTPUseCase(locator()));
  locator.registerSingleton<ResetPasswordUseCase>(
    ResetPasswordUseCase(locator()),
  );
  locator.registerSingleton<ResendOTPUseCase>(ResendOTPUseCase(locator()));

  locator.registerFactory<AuthenticationCubit>(
    () => AuthenticationCubit(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
