import 'package:flutter/material.dart';

import 'page/heroi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Heróis',
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade900,
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HeroiPage(),
    );
  }
}
