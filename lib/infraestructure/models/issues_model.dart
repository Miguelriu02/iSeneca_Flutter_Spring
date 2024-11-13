// To parse this JSON data, do
//
//     final issuesModel = issuesModelFromJson(jsonString);

import 'dart:convert';

import 'package:iseneca/domain/entities/issue_entity.dart';

List<IssuesModel> issuesModelFromJson(dynamic str) {
  if (str is String) {
    return List<IssuesModel>.from(json.decode(str).map((x) => IssuesModel.fromJson(x)));
  } else if (str is List) {
    return List<IssuesModel>.from(str.map((x) => IssuesModel.fromJson(x)));
  }
  throw const FormatException('Formato de entrada no válido');
}

String issuesModelToJson(List<IssuesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IssuesModel {
    String numeroAula;
    String correoDocente;
    DateTime fechaIncidencia;
    String descripcionIncidencia;
    String estadoIncidencia;
    String comentario;

    IssuesModel({
        required this.numeroAula,
        required this.correoDocente,
        required this.fechaIncidencia,
        required this.descripcionIncidencia,
        required this.estadoIncidencia,
        this.comentario = '',
    });

    factory IssuesModel.fromJson(Map<String, dynamic> json) => IssuesModel(
        numeroAula: json["numeroAula"],
        correoDocente: json["correoDocente"],
        fechaIncidencia: DateTime.fromMillisecondsSinceEpoch(json["fechaIncidencia"]),
        descripcionIncidencia: json["descripcionIncidencia"],
        estadoIncidencia: json["estadoIncidencia"],
        comentario: json["comentario"],
    );

    Map<String, dynamic> toJson() => {
        "numeroAula": numeroAula,
        "correoDocente": correoDocente,
        "fechaIncidencia": fechaIncidencia,
        "descripcionIncidencia": descripcionIncidencia,
        "estadoIncidencia": estadoIncidencia,
        "comentario": comentario,
    };

    IssuesEntity toIssuesEntity() => IssuesEntity(
      numeroAula: numeroAula,
      correoDocente: correoDocente,
      fechaIncidencia: fechaIncidencia,
      descripcionIncidencia: descripcionIncidencia,
    );
}
