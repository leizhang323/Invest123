import 'package:flutter/material.dart';
import 'package:invest123/app/home/account/account_page.dart';
import 'package:invest123/app/home/cupertino_home_scaffold.dart';
import 'package:invest123/app/home/tab_item.dart';
import 'package:invest123/app/home_page.dart';

import 'api_data/access_data_page.dart';

class MainHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainHomePage> {
  TabItem _currentTab = TabItem.homePage;

  // define item by key val pair
  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.homePage: (_) => HomePage(),
      TabItem.data: (_) => AccessDataPage(),
      TabItem.account: (_) => AccountPage(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    // build UI for each page
    return CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
    );
  }


}

