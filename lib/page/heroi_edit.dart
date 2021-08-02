import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/service/heroi_service.dart';
import 'package:flutter/material.dart';

enum Universo { Marvel, DC }

class HeroiEdit extends StatefulWidget {
  HeroiEdit(this.herois);

  final HeroiModel herois;

  @override
  _HeroiEditState createState() => _HeroiEditState();
}

class _HeroiEditState extends State<HeroiEdit> {
  _HeroiEditState();

  final HeroiService api = HeroiService();
  final _addKey = GlobalKey<FormState>();
  String id = '';
  final _nomeController = TextEditingController();
  final _nomeCivilController = TextEditingController();
  String universo = 'Marvel';
  Universo _universo = Universo.Marvel;

  @override
  void initState() {
    id = widget.herois.id;
    _nomeController.text = widget.herois.nome;
    _nomeCivilController.text = widget.herois.nomeCivil;
    universo = widget.herois.universo;
    if (widget.herois.universo == 'Marvel') {
      _universo = Universo.Marvel;
    } else {
      _universo = Universo.DC;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Herói'),
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
                                    api.updateHeroi(
                                        id,
                                        HeroiModel(
                                            nome: _nomeController.text,
                                            nomeCivil:
                                                _nomeCivilController.text,
                                            universo: universo));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Salvar'),
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
