import 'package:invest123/app/home/api_data/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static final String _url = "https://us-central1-mapin7-dev.cloudfunctions.net/firebaseApi/api/v1/foreclosure_zestimate";
  static final String _secretKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJpYXQiOjE1NzE5NTk0MDR9._SPRv49Lki4--hU-PIzYhw0HInofGHl4SJ44bMNaoCQ";
  static final String _foreclosureStatus = "Active";
  static final String _mlsStatus = "Active";

  static Data data = Data();

  static Future search() async {
      var url = _url;
      http.Response response = await http.post(url, body: {
        "secret_key": _secretKey,
        "foreclosureStatus": _foreclosureStatus,
        "mlsStatus": _mlsStatus,
      });
      final responseJson = json.decode(response.body);
      data = Data.fromJson(responseJson);
      return data.records;
  }
}