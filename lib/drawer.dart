import 'package:flutter/material.dart';

import 'page/heroi_add.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  _navigateToAddHeroi(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HeroiAdd()),
    );
  }

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
                radius: 51.0,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                    "assets/images/xovec.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
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
          _navigateToAddHeroi(context);
        },
        leading: Icon(
          Icons.add,
          color: Colors.black,
        ),
        title: Text("Adicionar"),
      ),
    ]);
  }
}
