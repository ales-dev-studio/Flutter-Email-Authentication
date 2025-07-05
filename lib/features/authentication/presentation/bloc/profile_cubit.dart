import 'package:bloc/bloc.dart';

import '../../../../core/enums/status_enums.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/app_snack_bar.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/usecases.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getProfileUseCase, this.updateProfileUseCase)
    : super(
        ProfileState(
          getProfileStatus: Status.initial,
          updateProfileStatus: Status.initial,
        ),
      );

  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  Future<void> getProfile() async {
    emit(state.copyWith(getProfileStatus: Status.loading));
    final DataState dataState = await getProfileUseCase();

    if (dataState is DataFailed) {
      emit(state.copyWith(getProfileStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      emit(state.copyWith(getProfileStatus: Status.success));
    }
  }

  Future<void> updateProfile({required UserModel userModel}) async {
    emit(state.copyWith(updateProfileStatus: Status.loading));
    final DataState dataState = await updateProfileUseCase(userModel);

    if (dataState is DataFailed) {
      emit(state.copyWith(updateProfileStatus: Status.failure));
      showSnackBar(dataState.error, snackBarType: SnackBarType.error);
    } else {
      showSnackBar(
        'Profile updated successfully',
        snackBarType: SnackBarType.success,
      );
      emit(state.copyWith(updateProfileStatus: Status.success));
    }
  }
}
