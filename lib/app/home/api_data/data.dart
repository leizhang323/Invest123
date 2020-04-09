import 'dart:convert';
class Data {
  final List<Record> records;
  Data({this.records});
  factory Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      records: parseRecords(json),
    );
  }

  static List<Record> parseRecords(recordsJson) {
    var list = recordsJson['records'] as List;
    List<Record> records = list.map((data) => Record.fromJson(data)).toList();
    return records;
  }

}

class Record {
  final Foreclosure foreclosure;
  final ZestimateInfo zestimateInfo;
  final Mls mls;
  Record({this.zestimateInfo, this.foreclosure, this.mls});
  factory Record.fromJson(Map<String, dynamic> json) {
    return new Record(
      foreclosure: Foreclosure.fromJson(json['foreclosure']),
      zestimateInfo: ZestimateInfo.fromJson(json['zestimate_info']),
      mls: Mls.fromJson(json['mls']),
    );
  }
}

class Foreclosure {
  final String street;
  final String city;
  Foreclosure({this.street, this.city});
  factory Foreclosure.fromJson(Map<String, dynamic> json) {
    return new Foreclosure(
      street: json['street'],
      city: json['city'],
    );
  }
}

class ZestimateInfo {
  final int zestimateAmount;
  final double ratio;
  ZestimateInfo({this.ratio, this.zestimateAmount});
  factory ZestimateInfo.fromJson(Map<String, dynamic> json) {
    return new ZestimateInfo(
      zestimateAmount: json['zestimateAmount'],
      ratio: json['ratio'] + .0,
    );
  }
}

class Mls {
  final int listing_price;
  Mls({this.listing_price});
  factory Mls.fromJson(Map<String, dynamic> json) {
    return new Mls(
      listing_price: json['listing_price'],
    );
  }
}

