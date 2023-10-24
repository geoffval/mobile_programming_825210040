import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'halaman_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences loginData;
  late bool newuser;

  @override
  void initState(){
    super.initState();
    check_login();
  }

  void check_login() async{
    loginData = await SharedPreferences.getInstance();
    newuser = (loginData.getBool('login') ?? true);

    print(newuser);
    if (newuser == false){
      Navigator.pushReplacement
        (context, new MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }

  @override
  void dispose(){
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Login Form", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text("Contoh Pengunaan Shared Preferences", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: username_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "password",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  String username = username_controller.text;
                  String password = password_controller.text;

                  if(username != '' && password != ''){
                    loginData.setBool('key', false);
                    loginData.setString('username', username);

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDashboard()));
                  }
                },
                child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
