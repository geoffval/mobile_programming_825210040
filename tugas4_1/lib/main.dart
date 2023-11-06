import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shared Preferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity
            .adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );}}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int? appCounter;

  @override
  void initState() {
    readAndWritePreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON')),
      body: Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'You have opened the app ' + appCounter.toString() +
                        ' times.'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Reset counter'),
                )],)),

      ),
    );
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter')!;
    if (appCounter == null) {
      appCounter = 1;
    } else {
      appCounter = (appCounter!) + 1;
    }

    await prefs.setInt('appCounter', appCounter!);

    setState(() {
      appCounter = appCounter;
    });
  }
  }