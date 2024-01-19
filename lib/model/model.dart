// To parse this JSON data, do
//
//     final serModel = serModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SerModel serModelFromJson(String str) => SerModel.fromJson(json.decode(str));

String serModelToJson(SerModel data) => json.encode(data.toJson());

class SerModel {
  bool success;
  String message;
  int code;
  Data data;

  SerModel({
    required this.success,
    required this.message,
    required this.code,
    required this.data,
  });

  factory SerModel.fromJson(Map<String, dynamic> json) => SerModel(
    success: json["success"],
    message: json["message"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  List<OpenedStore> openedStores;
  List<OpenedStore> notOpenedStores;

  Datum({
    required this.id,
    required this.name,
    required this.openedStores,
    required this.notOpenedStores,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"],
    openedStores: List<OpenedStore>.from(json["opened_stores"].map((x) => OpenedStore.fromJson(x))),
    notOpenedStores: List<OpenedStore>.from(json["not_opened_stores"].map((x) => OpenedStore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "opened_stores": List<dynamic>.from(openedStores.map((x) => x.toJson())),
    "not_opened_stores": List<dynamic>.from(notOpenedStores.map((x) => x.toJson())),
  };
}

class OpenedStore {
  int id;
  String name;
  String address;
  String description;
  String long;
  String lat;
  String phone;
  String workTime;
  List<dynamic> images;

  OpenedStore({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.long,
    required this.lat,
    required this.phone,
    required this.workTime,
    required this.images,
  });

  factory OpenedStore.fromJson(Map<String, dynamic> json) => OpenedStore(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    description: json["description"] ?? '',
    long: json["long"],
    lat: json["lat"],
    phone: json["phone"] ?? '',
    workTime: json["work_time"] ?? '',
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "description": description,
    "long": long,
    "lat": lat,
    "phone": phone,
    "work_time": workTime,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

enum Phone {
  PHONE_998555036006,
  THE_998555036006,
  THE_998555046006
}

final phoneValues = EnumValues({
  "+998 55 503 6006 ": Phone.PHONE_998555036006,
  "+998 55 503 6006": Phone.THE_998555036006,
  "+99855 504 6006": Phone.THE_998555046006
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
