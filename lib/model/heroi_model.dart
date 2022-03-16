class HeroiModel {
  String id;
  String name;
  String civil;
  String universe;

  HeroiModel({this.id, this.name, this.civil, this.universe});

  HeroiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    civil = json['civil'];
    universe = json['universe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['civil'] = this.civil;
    data['universe'] = this.universe;
    return data;
  }
}
