import 'package:flutter/material.dart';

class TelaAmbiente extends StatefulWidget {
  final String nomeHeroi;
  final String urlImage;
  final int coins;
  final int poder;
  final int vida;

  const TelaAmbiente({
    super.key,
    required this.nomeHeroi,
    required this.coins,
    required this.urlImage,
    required this.poder,
    required this.vida,
  });

  @override
  State<TelaAmbiente> createState() => TelaAmbienteState();
}

class TelaAmbienteState extends State<TelaAmbiente> {
  double posicaoHorizontalHeroi = 50;
  double posicaoVerticalHeroi = 20;
  double posHorizontalPocao = 150;
  double posVerticalPocao = 200;
  double posHorizontalVilao = 250;
  double posVerticalVilao = 20;
  late int vida;
  late int coins;

  bool pocaoColetada = false;

  @override
  void initState() {
    super.initState();
    vida = widget.vida;
    coins = widget.coins;
  }

  void andarParaDireita() {
    setState(() {
      posicaoHorizontalHeroi += 40;
    });
    checarColisao();
  }

  void andarParaEsquerda() {
    setState(() {
      posicaoHorizontalHeroi -= 40;
    });
    checarColisao();
  }

  void andarParaCima() async {
    setState(() {
      posicaoVerticalHeroi += 150;
    });
    checarColisao();
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      posicaoVerticalHeroi = 20;
    });
  }

  void checarColisao() {
    // Poção: cura 50 de vida
    if (!pocaoColetada) {
      bool bateX = (posicaoHorizontalHeroi - posHorizontalPocao).abs() < 60;
      bool bateY = (posicaoVerticalHeroi - posVerticalPocao).abs() < 60;
      if (bateX && bateY) {
        setState(() {
          pocaoColetada = true;
          vida += 50;
        });
      }
    }

    // Vilão: causa 30 de dano se encostar no herói
    bool vilaoX = (posicaoHorizontalHeroi - posHorizontalVilao).abs() < 60;
    bool vilaoY = (posicaoVerticalHeroi - posVerticalVilao).abs() < 60;
    if (vilaoX && vilaoY) {
      setState(() {
        vida -= 30;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nomeHeroi}  ❤️ $vida  💰 $coins'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('colorido.gif', fit: BoxFit.cover),
          ),

          if (!pocaoColetada)
            Positioned(
              left: posHorizontalPocao,
              bottom: posVerticalPocao,
              child: const Text('🧪', style: TextStyle(fontSize: 50)),
            ),

          Positioned(
            left: posHorizontalVilao,
            bottom: posVerticalVilao,
            child: const Text('👹', style: TextStyle(fontSize: 70)),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: posicaoHorizontalHeroi,
            bottom: posicaoVerticalHeroi,
            child: Image.asset(widget.urlImage, height: 120),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: andarParaEsquerda,
                  child: const Icon(Icons.arrow_back_ios_new, size: 30),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: andarParaDireita,
                  child: const Icon(Icons.arrow_forward_ios, size: 30),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: andarParaCima,
                  child: const Icon(Icons.arrow_circle_up, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
