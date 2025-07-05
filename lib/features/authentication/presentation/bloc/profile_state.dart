part of 'profile_cubit.dart';

class ProfileState {
  ProfileState({
    required this.getProfileStatus,
    required this.updateProfileStatus,
  });

  final Status getProfileStatus;
  final Status updateProfileStatus;

  ProfileState copyWith({
    Status? getProfileStatus,
    Status? updateProfileStatus,
  }) {
    return ProfileState(
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      updateProfileStatus: updateProfileStatus ?? this.updateProfileStatus,
    );
  }
}
