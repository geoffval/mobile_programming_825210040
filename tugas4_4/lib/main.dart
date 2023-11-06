import 'package:flutter/material.dart';
import 'dart:convert';
import './pizza.dart';
import 'httphelper.dart';
import 'pizza_detail.dart';

  void main() {
    runApp(MyApp());
  }
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter JSON Demo',
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

    String pizzaString = '';

    Future<List<Pizza>> callPizzas() async {
      HttpHelper helper = HttpHelper();
      List<Pizza>? pizzas = await helper.getPizzaList();
      return pizzas;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('JSON')),
        body: Container(
          child: FutureBuilder(
              future: callPizzas(),
              builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas){
                return ListView.builder(
                    itemCount: (pizzas.data ==null) ? 0 : pizzas.data?.length,
                    itemBuilder: (BuildContext context, int position) {
                      return Dismissible(
                          onDismissed: (item){
                            HttpHelper helper = HttpHelper();
                            pizzas.data?.removeWhere((element) => element.id ==
                                pizzas.data![position].id);
                            helper.deletePizza(pizzas.data![position].id);
                          },
                          key: Key(position.toString()),
                          child: ListTile(
                              title: Text(pizzas.data![position].pizzaName),
                              subtitle: Text(pizzas.data![position].description + ' -€ ' + pizzas.data![position].price.toString()),
                              onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PizzaDetail(pizzas.data![position], false)),
                                );
                              }
                          )
                      );
                    },
                );
              }
          ),
        ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    PizzaDetail(Pizza(), false)),
                );
              }),
      );
    }

    Future<List<Pizza>> readJsonFile() async {
      String myString = await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
      List myMap = jsonDecode(myString);
      List<Pizza> myPizzas = [];
      myMap.forEach((dynamic pizza) {
        //Pizza myPizza = Pizza.fromJson(pizza);
        //myPizzas.add(myPizza);
        Pizza myPizza = Pizza.fromJsonOrNull(pizza);
        if (myPizza != null) //Also this is now unnecessary and doesn't work properly because Flutter likes to break compatibility with older versions, thanks google
          myPizzas.add(myPizza);
      });
      String json = convertToJSON(myPizzas);
      print(json);
      return myPizzas;
      /*
      setState(() {
        pizzaString = myString;
      });
      */
    }

    @override
    void initState(){
      //readJsonFile();
      callPizzas();
      super.initState();
    }

    String convertToJSON(List<Pizza> pizzas) {
      String json = '[';
      pizzas.forEach((pizza) {
        json += jsonEncode(pizza);
      });
      json += ']';
      return json;
    }
  }