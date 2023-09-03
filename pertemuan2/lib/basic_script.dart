import 'package:flutter/material.dart';
import 'package:pertemuan2/immutable_widget.dart';
import 'package:pertemuan2/text_message.dart';

class BasicScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('My First App'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(Icons.home),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  /*        AspectRatio(
            aspectRatio: 1.0,
            child: ImmutableWidget(),
          ), */
          Image.asset('assets/beach.jpg'),
          TextMessage(),
        ]
      ),
    );
  }
}
