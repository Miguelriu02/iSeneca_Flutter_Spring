import 'package:flutter/material.dart';

void main() => runApp(const IssuesScreenAdmin());

class IssuesScreenAdmin extends StatelessWidget {
  const IssuesScreenAdmin({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Row(
          children: [
            const Expanded(
              child: Column(
                children: [
                  Text('Listado de Incidencias'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('Filtro de Incidencias'),
                  // Campos de filtro
                  DropdownButton<String>(
                    hint: const Text('Estado'),
                    items: <String>['PENDIENTE', 'EN_CURSO', 'FINALIZADO', 'CANCELADO']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                    ),
                  ),
                  // Campo para Fecha
                  // Aquí puedes agregar un DatePicker
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Aula',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Tipo',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}