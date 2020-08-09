import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilelogin/data/models/user.dart';
import 'package:mobilelogin/data/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Dependency Injection (DI)
  final UserRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GetUserCountryCode) {
      final countryCode = _userRepository.getUserCountryCode(event.countryCode);

      // print(countryCode);

      yield LoginCountryCodeOnChanged(countryCode);
    } else if (event is GetUser) {
      yield LoginLoading();

      print(event.countryCode);

      final user =
          await _userRepository.getUser(event.countryCode, event.phoneNumber);

      // print(user.phoneNumber);
      // print(GetUserPhoneNumber(user.phoneNumber).phoneNumber);

      yield LoginSuccess(user);
    }
  }
}
