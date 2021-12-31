// To parse this JSON data, do
//
//     final candidate = candidateFromJson(jsonString);

import 'dart:convert';

Candidate candidateFromJson(String str) => Candidate.fromJson(json.decode(str));

String candidateToJson(Candidate data) => json.encode(data.toJson());

class Candidate {
  Candidate({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.nobpCandidate,
    this.nama,
    this.jurusan,
    this.keterangan,
  });

  String? nobpCandidate;
  String? nama;
  String? jurusan;
  String? keterangan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nobpCandidate: json["nobp_candidate"],
        nama: json["nama"],
        jurusan: json["jurusan"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "nobp_candidate": nobpCandidate,
        "nama": nama,
        "jurusan": jurusan,
        "keterangan": keterangan,
      };
}
