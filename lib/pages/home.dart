import 'package:flutter/material.dart';
import 'package:linote/models/wordSuggestion.dart';
import 'dart:convert';
import 'package:linote/utils/api.dart';

Future<List> fetchWordList() async {
  var response = await getWordList();
  var items = json.decode(response.body)['items'];
  print('Some res: ${items[0]['heading']}');
  return items.map((word) => WordSuggestion.fromJson(word)).toList();
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Future<List> res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Hello Linote'),
                RaisedButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        res = fetchWordList();
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Fetch Tracks', style: TextStyle(fontSize: 20)),
                ),
                FutureBuilder<List>(
                    future: res,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ...snapshot.data.map((word) {
                                  print(word);
                                  return Text(word.heading);
                                })
                              ],
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    })
              ],
            )
          ],
        ),
      )),
    );
  }
}
