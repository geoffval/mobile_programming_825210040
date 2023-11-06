import 'package:flutter/material.dart';

class screenFrame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset(
              'assets/th-3498629592.jpg'),
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ //Place name
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87, decoration: TextDecoration.none, fontFamily: 'Arima'),
                        "Oeschinen Lake Campground",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Text(
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45, decoration: TextDecoration.none, fontFamily: 'Arima'),
                        "Kandersteg, Switzerland",
                      ),''
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[ //Rating
                    Icon(Icons.star, size: 24, color: Colors.red),
                    Text(
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54, decoration: TextDecoration.none, fontFamily: 'Arima'),
                      "41",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[ //Actions
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Icon(Icons.phone, color: Colors.lightBlue),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.lightBlue,
                            decoration: TextDecoration.none, fontFamily: 'Arima'
                        ),
                        "CALL"
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Icon(Icons.directions, color: Colors.lightBlue),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.lightBlue,
                            decoration: TextDecoration.none, fontFamily: 'Arima'
                        ),
                        "ROUTE"
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Icon(Icons.share, color: Colors.lightBlue),
                    ),
                    Text(
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.lightBlue,
                            decoration: TextDecoration.none, fontFamily: 'Arima'
                        ),
                        "SHARE"
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54, decoration: TextDecoration.none, fontFamily: 'Arima'),
              "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above the sea level, it is one of the larger Apline Lakes."
                  " A gondola ride from Kandersteg, followed by a half-hour walk throug pastures and pine forest, leads you to the lake, which warms to 20 degrees Celcius in the summer."
                  " Activities enjoyed here include rowing, and riding the summer toboggan run."
            ),
          ),
        ],
      ),
    );
  }
}
