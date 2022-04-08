import 'package:app_heroi/page/heroi_about.dart';
import 'package:flutter/material.dart';

import 'page/heroi_add.dart';
import 'page/heroi_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Rafael Horochovec'),
            accountEmail: new Text('rl.horochovec@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/xovec.jpg",
              ),
              backgroundColor: Colors.white,
            ),
          ),
          new ListTile(
            leading: Icon(
              Icons.people,
            ),
            title: Text('Heróis'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroiPage()));
            },
          ),
          new ListTile(
            leading: Icon(
              Icons.add,
            ),
            title: Text('Adicionar'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HeroiAdd()));
            },
          ),
          Divider(),
          new ListTile(
            leading: Icon(
              Icons.info,
            ),
            title: Text('Sobre'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroiAbout()));
            },
          ),
        ],
      ),
    );
  }
}
