import 'package:dio/dio.dart';
import 'package:iseneca/domain/entities/issue_entity.dart';
import 'package:iseneca/infraestructure/models/issues_model.dart';

class GetIssuesModel
{
  final _dio = Dio();

  Future<List<IssuesEntity>> getIssues() async 
  {
    try {
      final response = await _dio.post(
        'http://localhost:8888/incidencias',
        data: {}
      );
      
      if (response.statusCode == 200) {
        final issuesModelList = issuesModelFromJson(response.data);
        return issuesModelList.map((issuesModel) => issuesModel.toIssuesEntity()).toList();
      }
      
      throw Exception('Error al obtener las incidencias');
    } catch (e) {
      throw Exception('Error en la petición: $e');
    }
  }
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Future<void> postIssue(IssuesEntity) 
  async {
    try {
      final response = await _dio.put(
        'http://localhost:8888/incidencias',
        data: {
          issuesModelToJson(IssuesEntity)
        }
      );
      
      if (response.statusCode == 200) {
      print('Incidencia creada con exito: $IssuesEntity');
      }

      
      throw Exception('Error al obtener las incidencias');
    } catch (e) {
      throw Exception('Error en la petición: $e');
    }
  }
}