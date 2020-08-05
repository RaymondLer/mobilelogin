import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUnintialized extends AuthenticationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationLoading extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
