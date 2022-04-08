import 'package:app_heroi/model/heroi_model.dart';
import 'package:flutter/material.dart';

import 'heroi_detail.dart';

class HeroiList extends StatelessWidget {
  final List<HeroiModel> herois;
  HeroiList({Key key, this.herois}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: herois == null ? 0 : herois.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/' +
                  herois[index]
                      .name
                      .toLowerCase()
                      .replaceAll(RegExp(' '), '-') +
                  '.jpg'),
            ),
            title: Text(herois[index].name),
            subtitle: Text(herois[index].civil),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HeroiDetail(herois[index])));
            },
          );
        });
  }
}
