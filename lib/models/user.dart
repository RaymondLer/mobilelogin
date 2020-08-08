class User {
  final String countryCode;
  final String phoneNo;

  User({this.countryCode, this.phoneNo});

  User.fromJson(Map<String, dynamic> json)
      : countryCode = json['countryCode'],
        phoneNo = json['phoneNo'];
}
