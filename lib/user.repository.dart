import 'dart:math';

import 'models/user.dart';

class UserRepository {
  User _user;
  Future<User> getUser(String countryCode, String phoneNo) async {
    if (_user != null) return _user;

    final random = Random();
    if (random.nextBool()) {
      throw NoNetwork();
    }

    return Future.delayed(
      Duration(milliseconds: 300),
      () => _user = User(countryCode: countryCode, phoneNo: phoneNo),
    );
  }
}

class NoNetwork implements Exception {}
