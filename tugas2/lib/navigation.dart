import 'package:flutter/material.dart';
import 'countdown.dart';
import 'stopwatch.dart';
import 'about_screen.dart';
import 'login_screen.dart';

/// Flutter code sample for [NavigationBar].
class NavigationExample extends StatefulWidget {

  final String name;
  final String email;

  const NavigationExample({Key? key,required this.name,required this.email}) :super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.indigo[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.watch_outlined),
            icon: Icon(Icons.watch),
            label: 'Stopwatch',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.timer_outlined),
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.info_outline),
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
      body: <Widget>[
        StopWatch(),
        CountdownScreen(),
        About(),
      ][currentPageIndex],
    );
  }
}
