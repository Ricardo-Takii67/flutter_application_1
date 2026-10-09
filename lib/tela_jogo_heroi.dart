import 'package:flutter/material.dart';
import 'tela_ambiente.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});

  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String nomeHeroi = '';
  int vida = 0;
  int moedas = 0;
  int poder = 0;
  String urlImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Escolha seu herói:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => escolherHeroi('Guerreiro'),
                  child: const Text('Guerreiro'),
                ),
                ElevatedButton(
                  onPressed: () => escolherHeroi('Mago'),
                  child: const Text('Mago'),
                ),
                ElevatedButton(
                  onPressed: () => escolherHeroi('Arqueiro'),
                  child: const Text('Arqueiro'),
                ),
              ],
            ),
            // Só mostra a imagem depois que um herói for escolhido
            // (Image.asset com caminho vazio dá erro).
            if (urlImage.isNotEmpty)
              Image.asset(urlImage, height: 100, width: 100),
            Card(
              elevation: 5,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Classe: $nomeHeroi',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text('❤️ Vida: $vida',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.red)),
                    Text('💰 Moedas: $moedas',
                        style: const TextStyle(
                            fontSize: 18, color: Colors.orange)),
                    Text('⚔️ Poder: $poder',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.blue)),
                  ],
                ),
              ),
            ),
            // Botão desabilitado (null) enquanto nenhum herói foi escolhido.
            ElevatedButton(
              onPressed: nomeHeroi.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaAmbiente(
                            nomeHeroi: nomeHeroi,
                            vida: vida,
                            poder: poder,
                            coins: moedas,
                            urlImage: urlImage,
                          ),
                        ),
                      );
                    },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }

  void escolherHeroi(String tipoHeroi) {
    setState(() {
      if (tipoHeroi == 'Guerreiro') {
        nomeHeroi = 'Guerreiro';
        vida = 1000;
        poder = 300;
        moedas = 50;
        urlImage = 'guerreiro.jpg.png';
      } else if (tipoHeroi == 'Arqueiro') {
        nomeHeroi = 'Arqueiro';
        vida = 500;
        poder = 500;
        moedas = 50;
        urlImage = 'arqueiro.jpg.png';
      } else if (tipoHeroi == 'Mago') {
        nomeHeroi = 'Mago';
        vida = 1;
        poder = 6767;
        moedas = 50;
        urlImage = 'mago.png';
      }
    });
  }
}
