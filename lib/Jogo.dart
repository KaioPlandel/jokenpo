import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {

    var opcao = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcao[numero];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
        escolhaUsuario == "pedra" && escolhaApp == "tesoura" ||
        escolhaUsuario == "papel" && escolhaApp == "pedra" ||
        escolhaUsuario == "tesoura" && escolhaApp == "papel"
    ){
      setState(() {
        _mensagem = "Você ganhou";
      });
    }else {
      if(escolhaUsuario == escolhaApp){
        setState(() {
          _mensagem = "Empatou";
        });
      }else {
        setState(() {
          _mensagem = "Você perdeu";
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 4.0,
        title: const Text(
          "Jokenpo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
