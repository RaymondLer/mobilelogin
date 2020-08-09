import 'package:mobilelogin/data/models/user.dart';

class UserRepository {
  List<String> countriesCode = ['+60', '+65'];

  // String defaultValue;

  Future<User> getUser(String countryCode, String phoneNumber) {
    return Future.delayed(Duration(seconds: 1), () {
      return User(phoneNumber: countryCode + phoneNumber);
    });
  }

  static String defaultValue() => '+60';

  List<String> getCountryCodes() {
    return this.countriesCode;
  }

  String getUserCountryCode(String countryCode) {
    return countryCode;
  }

  String getUserPhoneNumber(String phoneNumber) {
    return phoneNumber;
  }
}
