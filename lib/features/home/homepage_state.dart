abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileIdle extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileEmpty extends ProfileState {}

abstract class BalanceState {}

class BalanceLoading extends BalanceState {}

class BalanceIdle extends BalanceState {}

class BalanceError extends BalanceState {}

class BalanceSuccess extends BalanceState {}

class BalanceEmpty extends BalanceState {}

abstract class ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesIdle extends ServicesState {}

class ServicesError extends ServicesState {}

class ServicesSuccess extends ServicesState {}

class ServicesEmpty extends ServicesState {}

abstract class BannerState {}

class BannerLoading extends BannerState {}

class BannerIdle extends BannerState {}

class BannerError extends BannerState {}

class BannerSuccess extends BannerState {}

class BannerEmpty extends BannerState {}
