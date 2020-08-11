import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final String texto;
  final List<String> respostas;
  final void Function() responder;

  Questionario({
    @required this.texto,
    @required this.respostas,
    @required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(texto),
        ...respostas.map((texto) => Resposta(texto, responder)).toList(),
      ],
    );
  }
}
