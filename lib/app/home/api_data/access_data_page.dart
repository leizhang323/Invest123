import 'package:flutter/material.dart';
import 'package:invest123/app/home/api_data/api_manager.dart';
import 'package:invest123/app/home/api_data/data.dart';
import 'package:invest123/app/home/api_data/detail_data_page.dart';

class AccessDataPage extends StatefulWidget {
  @override
  _AccessDataPageState createState() => _AccessDataPageState();
}

class _AccessDataPageState extends State<AccessDataPage> {

  final ApiManager apiManager = ApiManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Access Data'),
        actions: <Widget>[
          StreamBuilder<Object>(
            stream: apiManager.recordCount,
            builder: (context, snapshot) {
              return Chip(
                label: Text(
                    (snapshot.data ?? 0).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold, color:Colors.brown,
                  ),
                ),
                backgroundColor: Colors.white,
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: apiManager.apiListView,
        builder: (BuildContext context, AsyncSnapshot<List<Record>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }
          List<Record> records = snapshot.data;
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                  Record record = records[index];
                  return ListTile(
                      title: Text(record.foreclosure.street + " ," + record.foreclosure.city),
                      subtitle: Text("Listing Price: \$" + record.mls.listing_price.toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                        Navigator.push(
                            context,
                          MaterialPageRoute(
                            builder: (context) => DetailDataPage(),
                            settings: RouteSettings(
                              arguments: record
                            )
                          ),
                        );
                    },
                  );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: records?.length ?? 0,
          );
        }
      )
    );
  }
}
