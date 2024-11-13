import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iseneca/screens/incidencias/create_issues.dart';
import 'package:iseneca/screens/incidencias/show_issues.dart';
import 'package:iseneca/screens/interfaz/home_screen.dart';
class IssueScreen extends StatelessWidget {
  const IssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Bienvenido ${FirebaseAuth.instance.currentUser?.displayName} !',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<CreateIssuesScreen>(
                    builder: (context) => const CreateIssuesScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('Crear Incidencia'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<ShowIssuesScreen>(
                    builder: (context) => const ShowIssuesScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.list_alt),
              label: const Text('Ver Incidencias'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              icon: const Icon(Icons.logout),
              label: const Text('Volver'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}