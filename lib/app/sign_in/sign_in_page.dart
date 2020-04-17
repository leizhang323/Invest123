import 'package:flutter/material.dart';
import 'package:invest123/app/sign_in/email_sign_in_page.dart';
import 'package:invest123/app/sign_in/phone_sign_in_page.dart';
import 'package:invest123/app/sign_in/sign_in_button.dart';
import 'package:invest123/app/sign_in/social_sign_in_button.dart';
import 'package:invest123/services/auth.dart';
import 'package:provider/provider.dart';

// First Page: sign in page
class SignInPage extends StatelessWidget {


  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    // Navigation to certain page
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => EmailSignInPage(),
      ),
    );
  }

  void _signInWithPhone(BuildContext context) {
    // Navigation to certain page
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => PhoneSignInPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invest123'),
        elevation: 5.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  // underscore = private
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Welcom to Invest123!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Please sign in: ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          SocialSignInButton(
            text: 'Sign in with Email',
            assertName: 'images/email-logo.png',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 15.0),
          SocialSignInButton(
            text: 'Sign in with Google',
            assertName: 'images/google-logo.png',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(height: 15.0),
          SignInButton(
            text: 'Sign in with Phone',
            textColor: Colors.white,
            color: Colors.deepPurple,
            onPressed: () => _signInWithPhone(context),
          ),
        ],
      ),
    );
  }
}
