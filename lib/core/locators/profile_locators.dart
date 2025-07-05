import '../../features/authentication/domain/usecases/usecases.dart';
import '../../features/authentication/presentation/bloc/profile_cubit.dart';

import 'locator.dart';

Future<void> setupProfileLocators() async {
  locator.registerSingleton<UpdateProfileUseCase>(
    UpdateProfileUseCase(locator()),
  );
  locator.registerSingleton<GetProfileUseCase>(GetProfileUseCase(locator()));
  locator.registerFactory<ProfileCubit>(
    () => ProfileCubit(locator(), locator()),
  );
}
