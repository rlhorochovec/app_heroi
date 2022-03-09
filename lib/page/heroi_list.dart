import 'package:app_heroi/model/heroi_model.dart';
import 'package:flutter/material.dart';

import 'heroi_detail.dart';

class HeroiList extends StatelessWidget {
  final List<HeroiModel> herois;
  HeroiList({Key key, this.herois}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: herois == null ? 0 : herois.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroiDetail(herois[index])),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/' +
                        herois[index]
                            .nome
                            .toLowerCase()
                            .replaceAll(RegExp(' '), '-') +
                        '.jpg'),
                  ),
                  title: Text(herois[index].nome),
                  subtitle: Text(herois[index].nomeCivil),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ));
        });
  }
}
