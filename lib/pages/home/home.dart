import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_tasker/services/quote.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/nav_bar.dart';

import '../../services/quote.dart';
import '../../theme/card_quote.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> data= <Quote>[];

  Future<List<Quote>> getQuote() async{
    var url_http = Uri.parse( 'https://type.fit/api/quotes' );
    var response= await http.get(url_http);

    var quotes= <Quote>[];

    if(response.statusCode ==200)
    {
      var quoteJson = json.decode(response.body);

      for(var qJson in quoteJson){
        quotes.add(Quote.fromJson(qJson));
      }
    }
    return quotes;
  }

  @override
  void initState()
  {
    super.initState();
    getQuote().then((value) {
      setState(() {
        data.addAll(value);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
  int l=0;

  if (data.length>0)
    {
      l=5;
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: NavBar(),


      appBar: AppBar(
        backgroundColor: ColorTheme.blue,
        centerTitle: true,
        title: Text('Home Page',
        style: TextStyle(
          fontSize:25,
        ),),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Container(
          height: 6000,
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [

              Padding(
                padding: const EdgeInsets.fromLTRB(5, 40, 0, 5),
                child: Text('Quotes of the day :',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorTheme.txtlightblue,
                  letterSpacing: 1.2,
                ),
                ),
              ),

              Divider(
                color: Colors.grey,
                endIndent:80 ,
                indent: 10,
                thickness: 1.2 ,
                ),

              SizedBox(
                height: 300,
                width: 6000,
                child: ListView.builder(
                  itemBuilder: (context, index){
                return CardQuote(index: index, data: data);
                },
                  itemCount: l ,
                    scrollDirection: Axis.horizontal,
                ),
            ),

              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 0, 5),
                child: Text('Reminder :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorTheme.txtlightblue,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              Divider(
                color: Colors.grey,
                endIndent:80 ,
                indent: 10,
                thickness: 1.2 ,
              ),




        ]),
          ),
        ),
      ) ,
    );
  }
}
