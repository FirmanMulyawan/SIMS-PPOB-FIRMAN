abstract class ProfileUserState {}

class ProfileUserLoading extends ProfileUserState {}

class ProfileUserIdle extends ProfileUserState {}

class ProfileUserError extends ProfileUserState {}

class ProfileUserSuccess extends ProfileUserState {}

class ProfileUserEmpty extends ProfileUserState {}

abstract class ProfileEditState {}

class ProfileEditLoading extends ProfileEditState {}

class ProfileEditIdle extends ProfileEditState {}

class ProfileEditError extends ProfileEditState {}

class ProfileEditSuccess extends ProfileEditState {}

class ProfileEditEmpty extends ProfileEditState {}
