import 'package:flutter/material.dart';
import 'dart:math' as matematik;

Color rastgele() {
  return Color.fromARGB(
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255),
      matematik.Random().nextInt(255));
}

class Hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: rastgele(),
        appBar: AppBar(
          backgroundColor: rastgele(),
          title: Text("Hakkında"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
              color: Colors.greenAccent,
              margin: EdgeInsets.only(right: 50, left: 50, bottom: 5),
              child: ListTile(
                title: Text(
                  "İsim:",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "Hasan Sancaktar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            //Drawer(),
            Card(
              color: Colors.greenAccent,
              margin: EdgeInsets.only(right: 50, left: 50, bottom: 5),
              child: ListTile(
                title: Text(
                  "Email:",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "hasancaktar@gmail.com",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.brown,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            //Drawer(),
            Card(
              color: Colors.greenAccent,
              margin: EdgeInsets.only(right: 50, left: 50),
              child: ListTile(
                title: Text(
                  "GitHub: ",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "github.com/hasancaktar",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.brown,
                      fontStyle: FontStyle.italic),
                ),
              ),
            )
          ],
        ));
  }
}