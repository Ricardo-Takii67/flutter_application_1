import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_ambiente.dart';

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
        Image.asset(urlImage, height: 100, width: 100,),
        Card(
                elevation: 5, // Dá uma sombra 3D ao cartão
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Classe: $nomeHeroi', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Divider(), // Linha divisória
                      Text('❤️ Vida: $vida', style: const TextStyle(fontSize: 18, color: Colors.red)),
                      Text('💰 Moedas: $moedas', style: const TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('⚔️ Poder: $poder', style: const TextStyle(fontSize: 18, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
               ElevatedButton(
        onPressed: () { 
          Navigator.push(context,
          MaterialPageRoute(
          builder: (context)=> const
          TelaAmbiente(nomeHeroi, vida, poder, moedas, urlImage,
          ),
          );
        },
         child: Text('Entrar')
              ),
      ],
         ),
        ),
    
    );
    }

void escolherheroi(String tipoHeroi){
  setState((){
  if(tipoHeroi == "Guerreiro"){
    nomeHeroi = "Guerreiro";
    vida = 1000;
    poder = 300;
    moedas = 50;
    urlImage = "guerreiro.jpg.png";
  }

    else if(tipoHeroi == "Arqueiro"){
      nomeHeroi = "Arqueiro";
    vida = 500;
    poder = 500;
    moedas = 50;
    urlImage = "arqueiro.jpg.png";
    }

    else if(tipoHeroi == "Mago"){
      nomeHeroi = "Mago";
    vida = 1;
    poder = 6767;
    moedas = 50;
    urlImage = "mago.png";
    }
});
}
  }


  