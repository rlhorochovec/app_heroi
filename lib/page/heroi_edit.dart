import 'package:app_heroi/model/heroi_model.dart';
import 'package:app_heroi/page/heroi_page.dart';
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
  final _nameController = TextEditingController();
  final _civilController = TextEditingController();
  String universe = 'Marvel';
  Universo _universe = Universo.Marvel;

  @override
  void initState() {
    id = widget.herois.id;
    _nameController.text = widget.herois.name;
    _civilController.text = widget.herois.civil;
    universe = widget.herois.universe;
    if (widget.herois.universe == 'Marvel') {
      _universe = Universo.Marvel;
    } else {
      _universe = Universo.DC;
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
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              // icon: Icon(Icons.person),
                              hintText: 'Como as pessoas te chamam?',
                              labelText: 'Nome *',
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
                          TextFormField(
                            controller: _civilController,
                            decoration: const InputDecoration(
                              // icon: Icon(Icons.person),
                              hintText: 'Qual seu nome de registro?',
                              labelText: 'Nome civil *',
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
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    value: Universo.Marvel,
                                    groupValue: _universe,
                                    onChanged: (Universo value) {
                                      setState(() {
                                        _universe = value;
                                        universe = 'Marvel';
                                      });
                                    }),
                                Text('Marvel'),
                                Radio(
                                    value: Universo.DC,
                                    groupValue: _universe,
                                    onChanged: (Universo value) {
                                      setState(() {
                                        _universe = value;
                                        universe = 'DC';
                                      });
                                    }),
                                Text('DC'),
                              ])
                        ])),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            splashColor: Colors.red,
                            onPressed: () {
                              if (_addKey.currentState.validate()) {
                                _addKey.currentState.save();
                                api.update(
                                    id,
                                    HeroiModel(
                                        name: _nameController.text,
                                        civil: _civilController.text,
                                        universe: universe));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HeroiPage()));
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
    );
  }
}
