import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

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
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 6},
        {'texto': 'Verde', 'pontuacao': 2},
        {'texto': 'Branco', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorio?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Coelho', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 20},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorio?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 8},
        {'texto': 'João', 'pontuacao': 17},
        {'texto': 'Leo', 'pontuacao': 13},
        {'texto': 'Matheus', 'pontuacao': 5},
      ]
    },
  ];

  void _responder(int pontucao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontucao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
