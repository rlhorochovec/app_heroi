import 'package:app_heroi/model/heroi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),
                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),
                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: print,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Arquivar',
                  ),
                  SlidableAction(
                    onPressed: print,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Compartilhar',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    onPressed: print,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Editar',
                  ),
                  SlidableAction(
                    onPressed: print,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Excluir',
                  ),
                ],
              ),
              // The child of the Slidable is what the user sees when the
              // component is not dragged.
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeroiDetail(herois[index])));
                },
              ));
        });
  }
}
