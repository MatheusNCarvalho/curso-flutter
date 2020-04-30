import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  Function(String) sendMessage;

  TextComposer({this.sendMessage});

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  final TextEditingController _controller = TextEditingController();

  void _clearState() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
              onChanged: (text) {
                setState(() {
                  var textWitoutSpace = text.trim();
                  _isComposing = textWitoutSpace.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text);
                _clearState();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(_controller.text);
                    _clearState();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
