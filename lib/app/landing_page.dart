import 'package:flutter/material.dart';
import 'package:invest123/app/home/main_home_page.dart';
import 'package:invest123/app/sign_in/sign_in_page.dart';
import 'package:invest123/services/auth.dart';
import 'package:invest123/services/database.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            // has no user
            if (user == null) {
              return SignInPage();
            }
            // has user
            //return MainHomePage();
            return Provider<User>.value(
              value: user,
              child: Provider<Database>(
                builder: (_) => FirestoreDatabase(uid: user.uid),
                child: MainHomePage(),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                // loading, in progress
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
