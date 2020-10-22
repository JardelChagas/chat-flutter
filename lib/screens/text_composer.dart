import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMsg);
  final Function({String text, File img}) sendMsg;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  final TextEditingController _controller = TextEditingController();
  bool _isComposer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final File imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
              if(imgFile == null) return;
              widget.sendMsg(img: imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(hintText: "Enviar mensagem"),
              onChanged: (text){
                setState(() {
                  _isComposer = text.isNotEmpty;
                });
              },
              onSubmitted: (text){
                widget.sendMsg(text: text);
                _reset();

              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposer ? (){
              widget.sendMsg(text : _controller.text);
              _reset();
            } : null,
          )
        ],
      ),
    );
  }

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposer = false;
    });
  }
}
