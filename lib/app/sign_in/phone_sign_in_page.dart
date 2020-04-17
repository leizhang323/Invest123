import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest123/app/sign_in/validators.dart';
import 'package:invest123/common_widgets/platform_alert_dialog.dart';
import 'package:invest123/services/auth.dart';
import 'package:provider/provider.dart';

class PhoneSignInPage extends StatefulWidget with PhoneNumberAndOTPValidators{
  @override
  _PhoneSignInPageState createState() => _PhoneSignInPageState();
}

class _PhoneSignInPageState extends State<PhoneSignInPage> {



  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController OTPController = TextEditingController();

  String get phoneNum => phoneNumberController.text;
  String get smsCode => OTPController.text;
  String verificationId;
  bool codeSent = false;


  Future<void> verifyPhone(phoneNum) async {
    final auth = Provider.of<AuthBase>(context);
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential credential) async {
        await auth.signInWithPhone(credential);
        //Navigator.of(context).pop();
    };

    final PhoneVerificationFailed verifiedFailed = (AuthException exception) {
      PlatformAlertDialog(
        title: 'Sign in failed',
        content: exception.message.toString(),
        defaultActionText: 'OK',
      ).show(context);
    };

    final PhoneCodeSent smsSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNum,
        timeout: const Duration(seconds: 0),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verifiedFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrieve,
      );
  }

  Future<void> signInWithOTP(smsCode, verId) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      final authCredential = PhoneAuthProvider.getCredential(
          verificationId: verId, smsCode: smsCode
      );
      await auth.signInWithPhone(authCredential);
      Navigator.of(context).pop();
    } catch (e) {
      PlatformAlertDialog(
        title: 'Sign in failed',
        content: e.toString(),
        defaultActionText: 'OK',
      ).show(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 5.0,
      ),
      body: new Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                ),
              ),
              codeSent ? TextField(
                controller: OTPController,
                decoration: InputDecoration(
                    hintText: "Enter OTP",
                ),
              ) : Container(),
              SizedBox(height: 10.0,),
              codeSent ?
              RaisedButton(
                onPressed:  () {
                  if (smsCode.isNotEmpty) {
                    signInWithOTP(smsCode, verificationId);
                  } else {
                    PlatformAlertDialog(
                      title: 'Sign in failed',
                      content: 'SMS number cannt be empty',
                      defaultActionText: 'OK',
                    ).show(context);
                  }
                },
                child: Text("Login"),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.brown,
              ) :
              RaisedButton(
                onPressed: () {
                  if (phoneNum.isNotEmpty) {
                    verifyPhone(phoneNum);
                  } else {
                    PlatformAlertDialog(
                      title: 'Sign in failed',
                      content: 'Phone number cannt be empty',
                      defaultActionText: 'OK',
                    ).show(context);
                  }
                },
                child: Text("Verify"),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.brown,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
