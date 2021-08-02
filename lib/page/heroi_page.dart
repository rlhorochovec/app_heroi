import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'heroi_list.dart';

class HeroiPage extends StatefulWidget {
  HeroiPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HeroiPageState createState() => _HeroiPageState();
}

class _HeroiPageState extends State<HeroiPage> {
  final HeroiService api = HeroiService();
  List<HeroiModel> heroiList;

  @override
  Widget build(BuildContext context) {
    if(heroiList == null) {
      heroiList = List<HeroiModel>();
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Heróis'),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
              future: loadList(),
              builder: (context, snapshot) {
                return heroiList.length > 0? new HeroiList(herois: heroiList):
                new Center(child:
                new Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.title));
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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