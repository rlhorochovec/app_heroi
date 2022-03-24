import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../model/heroi_model.dart';
import 'heroi_add.dart';
import 'heroi_detail.dart';

class HeroiPage extends StatefulWidget {
  HeroiPage() : super();

  @override
  _HeroiPageState createState() => _HeroiPageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _HeroiPageState extends State<HeroiPage> {
  final _debouncer = Debouncer(milliseconds: 500);
  final HeroiService api = HeroiService();
  List<HeroiModel> listaHerois;
  List<HeroiModel> filtraHerois;

  @override
  void initState() {
    super.initState();
    api.read().then((herois) {
      setState(() {
        listaHerois = herois;
        filtraHerois = listaHerois;
      });
    });
  }

  _navigateToAddHeroi(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeroiAdd()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Heróis'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              hintText: 'Pesquisar por nome ou nome civil',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filtraHerois = listaHerois
                      .where((u) => (u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.civil.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filtraHerois == null ? 0 : filtraHerois.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HeroiDetail(filtraHerois[index])),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/' +
                            filtraHerois[index]
                                .name
                                .toLowerCase()
                                .replaceAll(RegExp(' '), '-') +
                            '.jpg'),
                      ),
                      title: Text(filtraHerois[index].name),
                      subtitle: Text(filtraHerois[index].civil),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddHeroi(context);
        },
        tooltip: 'Novo',
        child: Icon(Icons.add),
      ),
    );
  }
}
