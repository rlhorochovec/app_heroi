class HeroiModel {
  String id;
  String nome;
  String nomeCivil;
  String universo;

  HeroiModel({this.id, this.nome, this.nomeCivil, this.universo});

  HeroiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nomeCivil = json['nomeCivil'];
    universo = json['universo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nomeCivil'] = this.nomeCivil;
    data['universo'] = this.universo;
    return data;
  }
}