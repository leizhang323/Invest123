import 'package:flutter/material.dart';
import 'package:invest123/common_widgets/custom_raised_button.dart';

// create customized social sign in button
class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assertName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assertName),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
              Opacity(
                // 0.0 transparent
                opacity: 0.0,
                child: Image.asset(assertName),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
