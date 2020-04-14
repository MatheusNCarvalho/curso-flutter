import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

//https://api.hgbrasil.com/finance

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=c6316aaa";

void main() async {
  http.Response response = await http.get(request);
  json.decode(response.body);

  runApp(MaterialApp(
    home: Container(),
  ));
}
