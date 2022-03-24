import 'dart:ui';

import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';

import 'heroi_edit.dart';

class HeroiDetail extends StatefulWidget {
  HeroiDetail(this.heroi);

  final HeroiModel heroi;

  @override
  _HeroiDetailState createState() => _HeroiDetailState();
}

class _HeroiDetailState extends State<HeroiDetail> {
  _HeroiDetailState();

  final HeroiService api = HeroiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.heroi.name),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset(
            'assets/images/' +
                widget.heroi.name.toLowerCase().replaceAll(RegExp(' '), '-') +
                '.jpg',
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                    child: CircleAvatar(
                      radius: 91,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/' +
                            widget.heroi.name
                                .toLowerCase()
                                .replaceAll(RegExp(' '), '-') +
                            '.jpg'),
                        radius: 90,
                      ),
                    )),
                ListTile(
                  title: Text(widget.heroi.name),
                  subtitle: Text(widget.heroi.civil),
                ),
                Image(
                  image: AssetImage('assets/images/' +
                      widget.heroi.universe
                          .toLowerCase()
                          .replaceAll(RegExp(' '), '-') +
                      '.png'),
                  height: MediaQuery.of(context).size.height / 9,
                ),
              ],
            ),
          ),
        ]));
  }
}
