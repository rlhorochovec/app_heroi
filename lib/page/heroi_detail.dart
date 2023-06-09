import 'dart:ui';

import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';

import 'heroi_edit.dart';
import 'heroi_page.dart';

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
        appBar: AppBar(title: Text(widget.heroi.name), actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            onSelected: (selectedValue) {
              switch (selectedValue) {
                case 0:
                  _edit(context, widget.heroi);
                  break;
                case 1:
                  _confirmDialog();
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Editar"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Excluir"),
                ),
              ];
            },
          )
        ]),
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
                  color: Colors.grey.withOpacity(0.5),
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
                      radius: 85,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/' +
                            widget.heroi.name
                                .toLowerCase()
                                .replaceAll(RegExp(' '), '-') +
                            '.jpg'),
                        radius: 84,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                  child: Text(widget.heroi.name,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  child: Text(
                    widget.heroi.civil,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/' +
                      widget.heroi.universe
                          .toLowerCase()
                          .replaceAll(RegExp(' '), '-') +
                      '.png'),
                  height: MediaQuery.of(context).size.height / 7,
                ),
              ],
            ),
          ),
        ]));
  }

  _edit(BuildContext context, HeroiModel heroi) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeroiEdit(heroi)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Confirme!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Deseja excluir o(a) ' + widget.heroi.name + '?'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    api.del(widget.heroi.id);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HeroiPage()));
                  },
                ),
                FlatButton(
                  child: const Text('Não'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}
