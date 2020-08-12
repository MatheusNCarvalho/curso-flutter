import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;
  final List<Map<String, Object>> perguntas;

  Questionario({
    @required this.perguntaSelecionada,
    @required this.perguntas,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"]),
        ...respostas
            .map((resp) => Resposta(
                  resp["texto"],
                  () => quandoResponder(resp['pontuacao']),
                ))
            .toList(),
      ],
    );
  }
}
