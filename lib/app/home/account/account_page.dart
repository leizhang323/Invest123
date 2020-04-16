import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invest123/app/home/account/create_update_info_page.dart';
import 'package:invest123/common_widgets/avatar.dart';
import 'package:invest123/common_widgets/form_submit_button.dart';
import 'package:invest123/common_widgets/platform_alert_dialog.dart';
import 'package:invest123/services/auth.dart';
import 'package:invest123/services/database.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {


    Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      content: 'Are you sure you want to logout?',
      cancelActionText: 'Cancel',
      title: 'Logout',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }


    @override
  Widget build(BuildContext context) {
    // use sync instead async
    final database = Provider.of<Database>(context);
    //final dataUser = database.readUser();
    final user = Provider.of<User>(context);
    database.checkExist(user.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
        bottom: PreferredSize(
          child: _buildUserInfo(user),
          preferredSize: Size.fromHeight(150),
        ),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        Avatar(
          photoUrl: user.photoUrl,
          radius: 50,
        ),
        SizedBox(height: 10),
        if (user.displayName != null)
          Text(
            "User Name: " + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(height: 10),
        if (user.uid != null)
          Text(
            "User ID: " + user.uid,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(height: 10),
      ],
    );
  }
  }


   Widget _buildContent(BuildContext context) {
    final database = Provider.of<Database>(context);
    final user = Provider.of<User>(context);
      return StreamBuilder (
          stream: Firestore.instance
              .collection('users').document(user.uid).
          snapshots(),
          builder: (context, snapshot) {
           var userDocument = snapshot.data;
            if(snapshot.data == null) return Center(child: CircularProgressIndicator(),);
           return FutureBuilder(
             future: database.checkExist(user.uid),
             builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
               return Column(
                 children: <Widget>[
                   ListTile(
                     title: Text(
                       "First Name",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     subtitle: Text(
                       userDocument["first_name"] == null ? "null" : userDocument["first_name"],
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   ListTile(
                     title: Text(
                       "Last Name",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     subtitle: Text(
                       userDocument["last_name"] == null ? "null" : userDocument["last_name"],
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   ListTile(
                     title: Text(
                       "Phone Number",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     subtitle: Text(
                       userDocument["phone_number"] == null ? "null" : userDocument["phone_number"],
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   ListTile(
                     title: Text(
                       "Email Address",
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     subtitle: Text(
                       userDocument["email_address"] == null ? "null" : userDocument["email_address"],
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   SizedBox(height: 50),
                   FormSubmitButton(
                     text: 'Create or Update User Info',
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => CreateUpdateInfoPage(),
                         ),
                       );
                     },
                   ),
                 ],
               );
             },
           );
          });
    }
