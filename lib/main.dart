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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // brightness: Brightness.dark,
      ),
      home: HeroiPage(),
    );
  }
}
