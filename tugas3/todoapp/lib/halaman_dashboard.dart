import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/home_page.dart';
import 'package:todoapp/views/plan_creator_screen.dart';

class HalamanDashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyDashboard(),
    );
  }
}

class MyDashboard extends StatefulWidget {
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  late SharedPreferences loginData;
  late String username;

  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contoh Shared Preferences"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Welcome, $username!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  loginData.setBool("login", true);
                  Navigator.pop(context, new MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("Logout")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => PlanCreatorScreen()));
                },
                child: Text("Continue")
            ),
          ],
        ),
      ),
    );
  }
}
