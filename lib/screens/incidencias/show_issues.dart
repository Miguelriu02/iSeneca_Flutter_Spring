import 'package:flutter/material.dart';
import 'package:iseneca/providers/issues_provider.dart';
import 'package:provider/provider.dart';

class ShowIssuesScreen extends StatelessWidget {
  const ShowIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final issuesProvider = context.watch<IssuesProvider>();

    final issuesList = issuesProvider.issuesList;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Incidencias'),
      ),
      body: FutureBuilder(
        future: issuesProvider.provideIssues(),
        builder: (context, snapshot)
        {
          if (issuesProvider.issuesList.isEmpty) {
            return const Center(
              child: Text('No hay incidencias registradas'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: issuesProvider.issuesList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aula: ${issuesList[index].numeroAula}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text('Profesor: ${issuesList[index].correoDocente}'),
                      Text('Fecha: ${issuesList[index].fechaIncidencia}'),
                      Text('Descripción: ${issuesList[index].descripcionIncidencia}'),
                      const SizedBox(height: 8),
                      Text('Estado: ${issuesList[index].estadoIncidencia}'),
                      const SizedBox(height: 8),
                      Text('Comentario: ${issuesList[index].comentario}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}