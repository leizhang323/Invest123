import 'package:meta/meta.dart';
class DataUser {
  DataUser({this.emailAddress, this.firstname, this.lastname, this.phoneNumber, this.username});
  String username;
  String firstname;
  String lastname;
  String phoneNumber;
  String emailAddress;

  Map<String,dynamic> toMap() {
    return {
      'user_name': username,
      'first_name': firstname,
      'last_name': lastname,
      'phone_number': phoneNumber,
      'email_address': emailAddress,
    };
  }
}