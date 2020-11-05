
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'deprem.dart';
import 'hakkimizda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anlık Depremler',
      theme: ThemeData(
        fontFamily: "Itim",
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepOrange,
      ),
      home: Remote(),
    );
  }
}

class Remote extends StatefulWidget {
  @override
  _RemoteState createState() => _RemoteState();
}

class _RemoteState extends State<Remote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(backgroundColor: Colors.white24,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.red,
              ),
              onPressed: () {
                return Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hakkinda()));
              })
        ],
        title: Center(child: Text("Anlık Depremler",style: TextStyle(color: Colors.white),)),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Türkiye'de meydana gelen depremleri anlık olarak görüntüleyebilirsiniz.",
                  style: TextStyle(letterSpacing: 2,
                      fontSize: 27, color: Colors.white70,fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(40),
              ),
            ),
            Container(
              child: Divider(color: Colors.white24),
              padding: EdgeInsets.only(bottom: 50),
            ),
            Container(
              child: ButtonTheme(
                  focusColor: Colors.green,
                  minWidth: 51,
                  buttonColor: Colors.greenAccent,
                  height: 100,
                  child: Container(padding: EdgeInsets.only(right: 10,left: 10),
                    child: RaisedButton(padding: EdgeInsets.only(left: 10,right: 10),
                      elevation: 20,
                      child: Text(
                        "Görüntüle",
                        style: TextStyle(fontSize: 75),
                      ),
                      onPressed: () {
                        return Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EarthqueApp()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
