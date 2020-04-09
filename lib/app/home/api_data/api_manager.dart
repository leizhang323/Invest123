import 'dart:async';

import 'package:invest123/app/home/api_data/data.dart';
import 'package:invest123/services/api_service.dart';

class ApiManager {
  final StreamController<int> _recordCount = StreamController<int>();
  Stream<int> get recordCount => _recordCount.stream;

  Stream<List<Record>> get apiListView async* {
    yield await ApiService.search();
  }

  ApiManager() {
    apiListView.listen((list) => _recordCount.add(list.length));
  }
}