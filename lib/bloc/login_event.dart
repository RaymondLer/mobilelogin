part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetUser extends LoginEvent {
  final String countryCode;
  final String phoneNumber;

  const GetUser(this.countryCode, this.phoneNumber);

  @override
  List<Object> get props => [countryCode, phoneNumber];
}

class GetUserCountryCode extends LoginEvent {
  final String countryCode;

  const GetUserCountryCode(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

// class GetUserPhoneNumber extends LoginEvent {
//   final String phoneNumber;

//   const GetUserPhoneNumber(this.phoneNumber);

//   @override
//   List<Object> get props => [phoneNumber];
// }
