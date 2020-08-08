import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilelogin/bloc/authentication/AuthenticationEvent.dart';
import 'package:mobilelogin/bloc/authentication/AuthenticationState.dart';
import 'package:mobilelogin/user.repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository)
      : super(AuthenticationUnintialized());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is LoggedIn) {
      try {
        yield AuthenticationLoading();
        final user = await _userRepository.getUser(
            event.user.countryCode, event.user.phoneNo);
        yield AuthenticationSucess(user: user);
      } on AuthenticationNoNetwork {
        yield AuthenticationNoNetwork(errorMessage: 'No Internet.');
      }
    }
  }
}
