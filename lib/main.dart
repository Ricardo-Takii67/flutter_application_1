import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TelaInicial(title: 'Flutter Demo Home Page'),
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
          mainAxisAlignment: .center,
          children: [
            Text(
              'Caverna do Dragão',
              style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(onPressed: () {}, child: Text('Entrar')),
          ],
        ),
      ),
    );
  }
}
