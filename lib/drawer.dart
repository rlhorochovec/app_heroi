import 'package:flutter/material.dart';

import 'page/heroi_about.dart';
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
                backgroundColor: Colors.grey,
                radius: 61.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/xovec.jpg",
                  ),
                  radius: 60.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Rafael Horochovec",
                style: TextStyle(
                  fontSize: 18.0,
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
              context, MaterialPageRoute(builder: (context) => HeroiPage()));
        },
        leading: Icon(
          Icons.emoji_people,
          color: Colors.black,
        ),
        title: Text('Heróis'),
      ),

      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HeroiAdd()));
        },
        leading: Icon(
          Icons.add,
          color: Colors.black,
        ),
        title: Text('Adicionar'),
      ),

      Divider(),

      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HeroiAbout()));
        },
        leading: Icon(
          Icons.info,
          color: Colors.black,
        ),
        title: Text('Sobre'),
      ),
    ]);
  }
}
