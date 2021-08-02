import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/cupertino.dart';
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
        title: Text('Heróis'),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return heroiList.length > 0
                ? new HeroiList(herois: heroiList)
                : new Center(
                    child: new Text('No data found, tap plus button to add!',
                        style: Theme.of(context).textTheme.title));
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future loadList() {
    Future<List<HeroiModel>> futureHerois = api.getHerois();
    futureHerois.then((heroiList) {
      setState(() {
        this.heroiList = heroiList;
      });
    });
    return futureHerois;
  }

/*
  _navigateToAddScreen (BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
  */
}
