import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../drawer.dart';

class HeroiAbout extends StatefulWidget {
  @override
  _HeroiAboutState createState() => _HeroiAboutState();
}

class _HeroiAboutState extends State<HeroiAbout> {
  String appName = "";
  String appID = "";
  String version = "";
  String buildNumber = "";

  @override
  void initState() {
    super.initState();
    getAppInfo();
  }

  void getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName;
      appID = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.apps),
            title: Text("Aplicativo"),
            subtitle: Text(appName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Pacote (AppID)"),
            subtitle: Text(appID),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Versão"),
            subtitle: Text(version),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Build"),
            subtitle: Text(buildNumber),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.sentiment_satisfied_alt),
            title: Text("Rafael Horochovec"),
            subtitle: Text("2022 | Super Heróis"),
          ),
        ],
      ),
    );
  }
}
