import 'dart:convert';

PrimeModel primeModelFromJson(String str) =>
    PrimeModel.fromJson(json.decode(str));

String primeModelToJson(PrimeModel data) => json.encode(data.toJson());

class PrimeModel {
  List<PrimeData>? data;

  PrimeModel({
    this.data,
  });

  PrimeModel copyWith({
    List<PrimeData>? data,
  }) =>
      PrimeModel(
        data: data ?? this.data,
      );

  factory PrimeModel.fromJson(Map<String, dynamic> json) => PrimeModel(
        data: json["data"] == null
            ? []
            : List<PrimeData>.from(
                json["data"]!.map((x) => PrimeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PrimeData {
  int? primeNumber;
  DateTime? dateTime;

  PrimeData({
    this.primeNumber,
    this.dateTime,
  });

  PrimeData copyWith({
    int? primeNumber,
    DateTime? dateTime,
  }) =>
      PrimeData(
        primeNumber: primeNumber ?? this.primeNumber,
        dateTime: dateTime ?? this.dateTime,
      );

  factory PrimeData.fromJson(Map<String, dynamic> json) => PrimeData(
        primeNumber: json["prime_number"],
        dateTime: json["date_time"] == null
            ? null
            : DateTime.parse(json["date_time"]),
      );

  Map<String, dynamic> toJson() => {
        "prime_number": primeNumber,
        "date_time": dateTime?.toIso8601String(),
      };
}
