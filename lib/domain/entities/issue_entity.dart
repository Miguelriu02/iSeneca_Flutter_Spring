// ignore_for_file: file_names

class IssuesEntity {
  String numeroAula;
  String correoDocente;
  DateTime fechaIncidencia;
  String descripcionIncidencia;
  String estadoIncidencia;
  String comentario;

   IssuesEntity({
    required this.numeroAula,
    required this.correoDocente,
    required this.fechaIncidencia,
    required this.descripcionIncidencia,
    this.estadoIncidencia = 'Pendiente',
    this.comentario = '',
  });
}