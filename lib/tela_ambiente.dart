import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TelaAmbiente extends StatefulWidget {
  final double posicaoHorizontal = 40;
  final int miliss = 200;
  final String nomeHeroi = '';
  final String urlImage = '';
  final int coins = 0;
  final int poder;
  final int vida;

  const TelaAmbiente({required String nomeHeroi, required int coins, required String urlImage, super.key, required this.poder, required this.vida, });

  @override
  State<TelaAmbiente> createState() => TelaAmbienteState();
}

class TelaAmbienteState extends State<TelaAmbiente> {
  double posicaoHorizontalHeroi = 50;
  double posicaoVerticalHeroi = 20;
  double posHorizontalPocao = 150;
  double posVerticalPocao = 200;
  late int vida;


  bool pocaoColetada = false;

  void initState(){
    super.initState();
    vida = widget.vida;
  }

  void andarParaDireita() {
    setState(() {
      posicaoHorizontalHeroi += 40;
    });
  }
  void andarParaEsquerda() {
    setState(() {
      posicaoHorizontalHeroi += 40;
    });
  }
  void andarParaCima() async {
    setState(() {
      if (posicaoHorizontalHeroi > 10)
      posicaoVerticalHeroi += 20;
    });
      checarColisao();
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        posicaoVerticalHeroi = posicaoHorizontalHeroi - 40;
      });
    }
    void checarColisao() {
    if (pocaoColetada) return;

    bool bateX = (posicaoHorizontalHeroi - posHorizontalPocao) .abs() < 60;
    bool bateY = (posicaoVerticalHeroi - posVerticalPocao) .abs() < 60;
    setState(() {
      pocaoColetada = true;
    });
  }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sla ${widget.heroi}')
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(colorido.gif)
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
                      shape: const CircleBorder()
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, 
                      ),
                      onPressed: andarParaEsquerda, 
                      child: const Icon(Icon.arrow_back_ios_new, size: 30),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder()
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, 
                      ),
                      onPressed: andarParaDireita, 
                      child: const Icon(Icon.arrow_forward_ios, size: 30),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder()
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white, 
                      ),
                      onPressed: andarParaCima, 
                      child: const Icon(Icon.arrow_circle_up, size: 30),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
  