import 'package:equatable/equatable.dart';

class User extends Equatable {
  // final String countryCode;
  final String phoneNumber;

  User({this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
