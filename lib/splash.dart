import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'page/heroi_page.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF595959),
              Color(0xFF404040),
              Color(0xFF262626),
              Color(0xFF0d0d0d),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
          navigateAfterSeconds: HeroiPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 1.5,
              image: AssetImage(
                'assets/images/splash.png',
              ),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
