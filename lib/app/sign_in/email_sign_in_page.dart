import 'package:flutter/material.dart';
import 'package:invest123/app/sign_in/email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {

  @override
  // create email sign in page
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 5.0,
      ),
      // SingleChildScrollView can make page scrollable when cannot show
      // whole layout
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
