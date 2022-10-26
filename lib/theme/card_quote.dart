import 'package:flutter/material.dart';
import 'package:my_tasker/theme/colors.dart';

import '../services/quote.dart';

class CardQuote extends StatefulWidget {
  List<Quote> data;
  int index;
  CardQuote({required this.data, required this.index});

  @override
  State<CardQuote> createState() => _CardQuoteState(data: data, index : index);
}

class _CardQuoteState extends State<CardQuote> {
  List<Quote> data;
  int index;
  _CardQuoteState({required this.data, required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          color: ColorTheme.lightblue,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70.0)),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            child : Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      '${data[index].text}',
                      style:  TextStyle(
                        color: ColorTheme.txtblue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '- ${data[index].author}',
                      style:  TextStyle(
                        color: ColorTheme.txtlightblue,
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            )

    );

  }
}
