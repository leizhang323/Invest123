import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TabItem {homePage, data, account}

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.homePage: TabItemData(title: 'HomePage', icon: Icons.work),
    TabItem.data: TabItemData(title: 'AccessData', icon: Icons.view_headline),
    TabItem.account: TabItemData(title: 'Account', icon: Icons.person),
  };
}