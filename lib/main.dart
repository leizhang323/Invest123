import 'package:flutter/material.dart';
import 'package:invest123/app/landing_page.dart';
import 'package:invest123/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(InvestApp());
}

class InvestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      builder: (context) => Auth(),
      child: MaterialApp(
        title: 'Invest123',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: LandingPage(),
      ),
    );
  }
}


