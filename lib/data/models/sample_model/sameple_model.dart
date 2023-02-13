// To parse this JSON data, do
//
//     final sampleModel = sampleModelFromJson(jsonString);

import 'dart:convert';

Sample1Model? sampleModelFromJson(String str) => Sample1Model.fromJson(json.decode(str));

String sampleModelToJson(Sample1Model? data) => json.encode(data!.toJson());

class Sample1Model {
  Sample1Model({
    required this.status,
    required this.result,
  });

  int status;
  List<Result> result;

  factory Sample1Model.fromJson(Map<String, dynamic> json) => Sample1Model(
    status: json["status"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x!.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.order,
    required this.status,
  });

  int id;
  String image;
  String title;
  String subtitle;
  String description;
  int order;
  int status;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"]??0,
    image: json["image"]??"",
    title: json["title"]??"",
    subtitle: json["subtitle"]??"",
    description: json["description"]??"",
    order: json["order"]??0,
    status: json["status"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "order": order,
    "status": status,
  };
}
