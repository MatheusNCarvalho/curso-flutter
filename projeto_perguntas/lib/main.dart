import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorio?',
      'respostas': ['Cachorro', 'Coelho', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual é o seu instrutor favorio?',
      'respostas': ['Maria', 'João', 'Leo', 'Matheus']
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["respostas"]
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]["texto"]),
                  ...respostas
                      .map((texto) => Resposta(texto, _responder))
                      .toList(),
                ],
              )
            : Center(
                child: Text(
                  "Parabéns!",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
