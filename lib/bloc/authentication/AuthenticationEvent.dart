import 'package:equatable/equatable.dart';
import 'package:mobilelogin/models/user.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

// class AppStarted extends AuthenticationEvent {
//   bool isLoading;
//   Function loadingCallBack;
//   @override
//   String toString() => 'AppStarted';
// }

class LoggedIn extends AuthenticationEvent {
  final User user;

  LoggedIn({this.user});

  @override
  String toString() => "LoggedIn {user = $user}";

  @override
  List<Object> get props => [user];
}
