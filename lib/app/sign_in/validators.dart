// check email and password format
abstract class StringValidator {
  bool isValid(String value);

}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

// mixin
class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email cannot be empty';
  final String invalidPasswordErrorText = 'Password cannot be empty';
}

class PhoneNumberAndOTPValidators {
  final StringValidator phoneNumberValidator = NonEmptyStringValidator();
  final StringValidator OTPValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Phone number cannot be empty';
  final String invalidPasswordErrorText = 'SMS cannot be empty';
}
