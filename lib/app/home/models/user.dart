import 'package:meta/meta.dart';
class DataUser {
  DataUser({this.emailAddress, this.firstname, this.lastname, this.phoneNumber, this.username});
  final String username;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String emailAddress;

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