import 'package:mobilelogin/models/user.dart';

abstract class AuthenticationState {}

class AuthenticationUnintialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnintialized';
}

class AuthenticationSucess extends AuthenticationState {
  User user;

  AuthenticationSucess({this.user});

  @override
  String toString() => 'AuthenticationAuthenticated';
}

// class AuthenticationUnauthenticated extends AuthenticationState {
//   @override
//   String toString() => 'AuthenticationUnauthenticated';
// }

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationNoNetwork extends AuthenticationState {
  final String errorMessage;

  AuthenticationNoNetwork({this.errorMessage});

  @override
  String toString() => 'Authentication No Network';

  // @override
  // List<Object> get props => [errorMessage];
}
