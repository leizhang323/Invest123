
import 'package:flutter/material.dart';
import 'package:invest123/app/home/models/user.dart';
import 'package:invest123/common_widgets/form_submit_button.dart';
import 'package:invest123/services/auth.dart';
import 'package:invest123/services/database.dart';
import 'package:provider/provider.dart';
class CreateUpdateForm extends StatefulWidget {
 @override
  _CreateUpdateFormState createState() => _CreateUpdateFormState();
}

class _CreateUpdateFormState extends State<CreateUpdateForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();

  String get _firstName => _firstNameController.text;
  String get _lastName => _lastNameController.text;
  String get _phoneNumber => _phoneNumberController.text;
  String get _emailAddress => _emailAddressController.text;

  _submit() async {
    DataUser dataUser = DataUser();
    final user = Provider.of<User>(context);
    final database = Provider.of<Database>(context);
    if (_firstName != "") {
      dataUser.firstname = _firstName;
      await database.updateFirstName(user.uid, _firstName);
    }
    if (_lastName != "") {
      dataUser.lastname = _lastName;
      await database.updateLastName(user.uid, _lastName);
    }
      if (_phoneNumber != "") {
        dataUser.phoneNumber = _phoneNumber;
        await database.updatePhoneNumber(user.uid, _phoneNumber);
      }
      if (_emailAddress != "") {
        dataUser.emailAddress = _emailAddress;
        await database.updateEmailAddress(user.uid, _emailAddress);
      }
      Navigator.of(context).pop();
    }
  List<Widget> _buildChildren() {
    return [
      TextField(
        controller: _firstNameController,
        decoration: InputDecoration(
          labelText: 'First Name',
        ),
      ),
      SizedBox(height: 20,),
      TextField(
        controller: _lastNameController,
        decoration: InputDecoration(
          labelText: 'Last Name',
        ),
      ),
      SizedBox(height: 20,),
      TextField(
        controller: _phoneNumberController,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          hintText: '000-000-0000',
        ),
      ),
      SizedBox(height: 20,),
      TextField(
        controller: _emailAddressController,
        decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'abc123@gmail.com'
        ),
      ),
      SizedBox(height: 80,),
      FormSubmitButton(
        text: 'OK',
        onPressed: () => _submit(),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: _buildChildren(),
    );
  }
}



