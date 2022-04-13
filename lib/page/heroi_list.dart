import 'package:app_heroi/model/heroi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../service/heroi_service.dart';
import 'heroi_detail.dart';
import 'heroi_edit.dart';
import 'heroi_page.dart';

class HeroiList extends StatelessWidget {
  final List<HeroiModel> herois;
  final HeroiService api = HeroiService();
  HeroiList({Key key, this.herois}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: herois == null ? 0 : herois.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
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
              onTap: () => _details(context, herois[index]),
            ),
            actions: <Widget>[
              IconSlideAction(
                closeOnTap: true,
                caption: 'Detalhes',
                color: Colors.black45,
                icon: Icons.info,
                onTap: () => _details(context, herois[index]),
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                closeOnTap: true,
                caption: 'Editar',
                color: Colors.black45,
                icon: Icons.edit,
                onTap: () => _edit(context, herois[index]),
              ),
              IconSlideAction(
                closeOnTap: true,
                caption: 'Excluir',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _confirmDialog(context, herois[index]),
              ),
            ],
          );
        });
  }

  _details(BuildContext context, HeroiModel heroi) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeroiDetail(heroi)));
  }

  _edit(BuildContext context, HeroiModel heroi) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeroiEdit(heroi)),
    );
  }

  Future<void> _confirmDialog(BuildContext context, HeroiModel heroi) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return AlertDialog(
              title: Text('Confirme!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Deseja excluir o(a) ' + heroi.name + '?'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    api.del(heroi.id);
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
