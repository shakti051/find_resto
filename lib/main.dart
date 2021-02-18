import 'package:flutter/material.dart';
import 'package:mobulous_test/screens/products.dart';
import 'package:mobulous_test/screens/search_bar.dart';
import 'package:mobulous_test/screens/stores.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Search For Honey'),
            bottom: TabBar(
              tabs: [Tab(text: "Products"), Tab(text: "Stores")],
            ),
          ),
          body: TabBarView(
            children: [Products(), Stores()],
          ),
        ),
      ),
    );
  }
}
