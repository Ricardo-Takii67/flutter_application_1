import 'package:flutter/material.dart';
import 'tela_jogo_heroi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(title: 'Casa do Scapeline'),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Casa do Scapeline',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaJogoHeroi(),
                  ),
                );
              },
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 16),
            Image.asset('RobertoMichelan.jpg', height: 200),
          ],
        ),
      ),
    );
  }
}
