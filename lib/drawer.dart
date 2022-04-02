import 'package:app_heroi/page/heroi_about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/heroi_add.dart';
import 'page/heroi_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 61.0,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                    "assets/images/xovec.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Rafael Horochovec",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "rl.horochovec@gmail.com",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeroiPage()),
          );
        },
        leading: Icon(
          Icons.groups_sharp,
          color: Colors.black,
        ),
        title: Text("Heróis"),
      ),
      ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeroiAdd()),
          );
        },
        leading: Icon(
          Icons.person_add,
          color: Colors.black,
        ),
        title: Text("Adicionar"),
      ),
      Divider(
        color: Colors.black,
      ),
      ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeroiAbout()),
          );
        },
        leading: Icon(
          Icons.info,
          color: Colors.black,
        ),
        title: Text("Sobre"),
      ),
    ]);
  }
}
