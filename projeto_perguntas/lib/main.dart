import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorio?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}
