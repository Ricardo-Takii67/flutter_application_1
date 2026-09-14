import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});
  
  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
  }
    
    
  class TelaJogoHeroiState extends State<TelaJogoHeroi> {
      String nomeHeroi = "";
      int vida = 0;
      int moedas = 0;
      int poder = 0;
      String urlImage = '';

    @override
    Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(
      child: Column(children: [
        Text("Escolha seu heroi:"),
        Row(
          children: [
          ElevatedButton(
              onPressed: () => escolherheroi("Guerreiro"), 
              child: Text("Guerreiro"),
              ),
          ElevatedButton(
              onPressed: () => escolherheroi("Mago"), 
              child: Text("Mago"),
              ),
          ElevatedButton(
              onPressed: () => escolherheroi("Arqueiro"), 
              child: Text("Arqueiro"),
              ),
          ],
        ),
        Image.network(),
        Card(
                elevation: 5, // Dá uma sombra 3D ao cartão
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Classe: $heroiSelecionado', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Divider(), // Linha divisória
                      Text('❤️ Vida: $vida', style: const TextStyle(fontSize: 18, color: Colors.red)),
                      Text('💰 Moedas: $moedas', style: const TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('⚔️ Poder: $poder', style: const TextStyle(fontSize: 18, color: Colors.blue)),
                    ],
                  ),
                ),
              )
      ],
         ),
        ),
    
    );
    }

void escolherheroi(String tipoHeroi){
  setState((){
  if(tipoHeroi == "Guerreiro"){
    vida = 1000;
    poder = 300;
    moedas = 50;
    urlImage = "";
  }

    else if(tipoHeroi == "Arqueiro"){
    vida = 500;
    poder = 500;
    moedas = 50;
    urlImage = "";
    }

    else if(tipoHeroi == "Mago"){
    vida = 1;
    poder = 6767;
    moedas = 50;
    urlImage = "";
    }
  )
}
  }


  