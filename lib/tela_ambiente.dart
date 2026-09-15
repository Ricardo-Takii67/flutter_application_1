import 'package:flutter/material.dart';

class TelaAmbiente extends StatefulWidget {
  final String heroi;
  final String urlImage;

  const TelaAmbiente(String nomeHeroi, int vida, int poder, int moedas, String urlImage, {
    super.key,
    required this.heroi,
    required this.urlImage
  });

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}