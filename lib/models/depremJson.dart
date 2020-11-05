// To parse this JSON data, do
//
//     final depremlerModel = depremlerModelFromJson(jsonString);

import 'dart:convert';

DepremlerModel depremlerModelFromJson(String str) => DepremlerModel.fromJson(json.decode(str));

String depremlerModelToJson(DepremlerModel data) => json.encode(data.toJson());

class DepremlerModel {
  DepremlerModel({
    this.status,
    this.result,
  });

  bool status;
  List<Result> result;

  factory DepremlerModel.fromJson(Map<String, dynamic> json) => DepremlerModel(
    status: json["status"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.mag,
    this.lng,
    this.lat,
    this.lokasyon,
    this.depth,
    this.coordinates,
    this.title,
    this.rev,
    this.timestamp,
    this.dateStamp,
    this.date,
    this.hash,
    this.hash2,
  });

  double mag;
  double lng;
  double lat;
  String lokasyon;
  double depth;
  List<double> coordinates;
  String title;
  String rev;
  int timestamp;
  DateTime dateStamp;
  String date;
  String hash;
  String hash2;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    mag: json["mag"].toDouble(),
    lng: json["lng"].toDouble(),
    lat: json["lat"].toDouble(),
    lokasyon: json["lokasyon"],
    depth: json["depth"].toDouble(),
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    title: json["title"],
    rev: json["rev"] == null ? null : json["rev"],
    timestamp: json["timestamp"],
    dateStamp: DateTime.parse(json["date_stamp"]),
    date: json["date"],
    hash: json["hash"],
    hash2: json["hash2"],
  );

  Map<String, dynamic> toJson() => {
    "mag": mag,
    "lng": lng,
    "lat": lat,
    "lokasyon": lokasyon,
    "depth": depth,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "title": title,
    "rev": rev == null ? null : rev,
    "timestamp": timestamp,
    "date_stamp": "${dateStamp.year.toString().padLeft(4, '0')}-${dateStamp.month.toString().padLeft(2, '0')}-${dateStamp.day.toString().padLeft(2, '0')}",
    "date": date,
    "hash": hash,
    "hash2": hash2,
  };
}



