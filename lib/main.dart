import 'package:flutter/material.dart';
import 'tabs/first_tab.dart';
import 'tabs/second_tab.dart';
import 'tabs/terza_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.favorite_outline)),
              Tab(icon: Icon(Icons.settings_outlined))
            ],
          ),
          title: Text("Tabs"),
        ),
        body: TabBarView(
          children: [RxDartCounterExample(), SecondTab(), ThirdTab()],
        ),
      ),
    ));
  }
}
