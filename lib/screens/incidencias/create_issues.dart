// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iseneca/domain/entities/issue_entity.dart';
import 'package:iseneca/providers/issues_provider.dart';
import 'package:provider/provider.dart';

class CreateIssuesScreen extends StatefulWidget {
  const CreateIssuesScreen({super.key});

  @override
  State<CreateIssuesScreen> createState() => _CreateIssuesScreenState();
}

class _CreateIssuesScreenState extends State<CreateIssuesScreen> {
  final TextEditingController _classroomController = TextEditingController();
  final TextEditingController _teacherEmailController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _classroomController.dispose();
    _teacherEmailController.dispose();
    _dateTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final issuesProvider = Provider.of<IssuesProvider>(context, listen: false);

    _teacherEmailController.text = '${FirebaseAuth.instance.currentUser?.email}';

    _dateTimeController.text = DateTime.now().toString();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Incidencia'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Text(
                  'La incidencia se enviará con el siguiente correo: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${FirebaseAuth.instance.currentUser?.email}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _classroomController,
                decoration: const InputDecoration(
                  labelText: 'Número de Aula',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _teacherEmailController,
                decoration: const InputDecoration(
                  labelText: 'Correo del Profesor',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateTimeController,
                decoration: const InputDecoration(
                  labelText: 'Fecha y Hora de Detección',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    
                    if (time != null) {
                      final dateTime = DateTime(
                        date.year,
                        date.month, 
                        date.day,
                        time.hour,
                        time.minute
                      );
                      
                      _dateTimeController.text = 
                          '${dateTime.day}/${dateTime.month}/${dateTime.year} ${time.format(context)}';
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descripción de la Incidencia',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final issueEntity = IssuesEntity(
                    numeroAula: _classroomController.text,
                    correoDocente: _teacherEmailController.text,
                    fechaIncidencia: DateTime.parse(_dateTimeController.text),
                    descripcionIncidencia: _descriptionController.text,
                  );
                  
                  issuesProvider.createIssue(issueEntity);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incidencia creada con éxito')),
                  );
                  
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Enviar Incidencia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}