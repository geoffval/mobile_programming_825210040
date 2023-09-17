import 'package:flutter/material.dart';
import 'countdown.dart';
import 'stopwatch.dart';
import 'login_screen.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body:
        Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87, decoration: TextDecoration.none, fontFamily: 'Arima'),
                          "NPM: 825210040",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87, decoration: TextDecoration.none, fontFamily: 'Arima'),
                          "NAMA: GEOFFREY VALHART HARIYONO",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              'assets/FTI UNTAR.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/Logo SI clear.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}


