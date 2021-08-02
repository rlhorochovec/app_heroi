import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';

enum Universo { Marvel, DC }

class HeroiAdd extends StatefulWidget {
  HeroiAdd();

  @override
  _HeroiAddState createState() => _HeroiAddState();
}

class _HeroiAddState extends State<HeroiAdd> {
  _HeroiAddState();

  final HeroiService api = HeroiService();
  final _addKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _nomeCivilController = TextEditingController();
  String universo = 'Marvel';
  Universo _universo = Universo.Marvel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Herói'),
      ),
      body: Form(
        key: _addKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nome'),
                              TextFormField(
                                controller: _nomeController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Insira seu nome';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nome Civil'),
                              TextFormField(
                                controller: _nomeCivilController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome Civil',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Insira seu nome civil';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Universo'),
                              ListTile(
                                title: const Text('Marvel'),
                                leading: Radio(
                                  value: Universo.Marvel,
                                  groupValue: _universo,
                                  onChanged: (Universo value) {
                                    setState(() {
                                      _universo = value;
                                      universo = 'Marvel';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('DC'),
                                leading: Radio(
                                  value: Universo.DC,
                                  groupValue: _universo,
                                  onChanged: (Universo value) {
                                    setState(() {
                                      _universo = value;
                                      universo = 'DC';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addKey.currentState.validate()) {
                                    _addKey.currentState.save();
                                    api.createHeroi(HeroiModel(
                                        nome: _nomeController.text,
                                        nomeCivil: _nomeCivilController.text,
                                        universo: universo));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Salvar',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
