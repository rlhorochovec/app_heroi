import 'package:app_heroi/drawer.dart';
import 'package:flutter/material.dart';

import 'page/heroi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Dark theme of your app
  final ThemeData _darkTheme = ThemeData(
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heróis',
      theme: _darkTheme,
      home: HeroiPage(),
    );
  }
}
