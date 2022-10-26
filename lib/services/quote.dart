import 'package:http/http.dart' as http;
import 'dart:convert';


class Quote{
  String? text;
  String? author;


  Quote(this.text, this.author);

  Quote.fromJson(Map<String,dynamic> json)
  {
    text=json['text'];
    author=json['author'];
  }

}