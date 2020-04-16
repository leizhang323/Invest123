import 'package:flutter/material.dart';
import 'package:invest123/app/home/account/create_update_form.dart';

class CreateUpdateInfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create or Update User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: CreateUpdateForm(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
