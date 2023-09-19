import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/path-through-forest-with-light-ground-trees-are-covered-moss_421632-845.jpg?w=2000"),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      'Nickname',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.male, color: Colors.blue,),
                      title: Text("abcd@stu.untar.ac.id",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        final player = AudioPlayer();
                        await player.play(AssetSource('jixaw-metal-pipe-falling-sound.mp3'));
                      },
                      icon: Icon(Icons.music_note),
                      label: Text('Click Me!'),
                  ),
                  /*Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(8),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, color: Colors.blue,),
                        SizedBox(width: 10,),
                        Text('abcd@stu.untar.ac.id')
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      );
  }
}

