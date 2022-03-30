import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/page/heroi_add.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';

import 'heroi_list.dart';

class HeroiPage extends StatefulWidget {
  HeroiPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HeroiPageState createState() => _HeroiPageState();
}

class _HeroiPageState extends State<HeroiPage> {
  final HeroiService api = HeroiService();
  List<HeroiModel> heroiList;

  @override
  Widget build(BuildContext context) {
    if (heroiList == null) {
      heroiList = List<HeroiModel>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel | DC Heróis'),
      ),
      body: new Container(
        color: Colors.black,
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return heroiList.length > 0
                ? new HeroiList(herois: heroiList)
                : new Center(
                    child: new Text('Não há registros a serem exibidos.',
                        style: Theme.of(context).textTheme.headline6));
          },
        )),
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

  Future loadList() {
    Future<List<HeroiModel>> futureHerois = api.read();
    futureHerois.then((heroiList) {
      setState(() {
        this.heroiList = heroiList;
      });
    });
    return futureHerois;
  }

  _navigateToAddHeroi(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeroiAdd()),
    );
  }
}
