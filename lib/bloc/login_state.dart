part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final User user;
  // final String phoneNumber;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  final String errorMessage;

  const LoginFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginCountryCodeOnChanged extends LoginState {
  final String countryCode;

  const LoginCountryCodeOnChanged(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}
