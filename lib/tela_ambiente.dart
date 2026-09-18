import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TelaAmbiente extends StatefulWidget {
  final double posicaoHorizontal = 40;
  final int miliss = 200;
  final String nomeHeroi = '';
  final String urlImage = '';
  final int coins = 0;
  final int poder = 0;
  final int vida = 0;

  const TelaAmbiente({required String nomeHeroi, required int vida, required int poder, required int coins, required String urlImage, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => TelaAmbienteState();
}
class TelaAmbienteState extends State<TelaAmbiente> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/colorido.gif',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: widget.miliss),
            curve: Curves.bounceIn,
            left: widget.posicaoHorizontal,
            bottom: 120,
            child: Image.asset(
              widget.urlImage,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }}