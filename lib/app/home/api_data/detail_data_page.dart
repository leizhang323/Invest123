import 'package:flutter/material.dart';
import 'package:invest123/app/home/api_data/data.dart';

class DetailDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Record record = ModalRoute.of(context).settings.arguments;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Address: " + record.foreclosure.street + " ," + record.foreclosure.city,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              "Listing Price: \$" + record.mls.listing_price.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              "Zestimate Price: \$" + record.zestimateInfo.zestimateAmount.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              "Zestimate Ratio: " + (record.zestimateInfo.ratio * 100).toString() + "%",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
