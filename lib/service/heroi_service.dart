import 'dart:convert';

import 'package:app_heroi/model/heroi_model.dart';
import 'package:http/http.dart';

class HeroiService {
  final String apiUrl = "https://heroi-api.herokuapp.com/api/herois";

  Future<List<HeroiModel>> getHerois() async {
    Response res = await get(Uri.parse('$apiUrl/all'));

    if (res.statusCode == 200) {
      String source = Utf8Decoder().convert(res.bodyBytes);
      List<dynamic> body = jsonDecode(source);
      List<HeroiModel> herois =
          body.map((dynamic item) => HeroiModel.fromJson(item)).toList();
      return herois;
    } else {
      throw "Failed to load list";
    }
  }

  Future<HeroiModel> getHeroiById(String id) async {
    final res = await get(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      String source = Utf8Decoder().convert(res.bodyBytes);
      return HeroiModel.fromJson(json.decode(source));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<HeroiModel> createHeroi(HeroiModel heroi) async {
    Map data = {
      'nome': heroi.nome,
      'nomeCivil': heroi.nomeCivil,
      'universo': heroi.universo
    };

    final Response res = await post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      String source = Utf8Decoder().convert(res.bodyBytes);
      return HeroiModel.fromJson(json.decode(source));
    } else {
      throw Exception('Failed to post');
    }
  }

  Future<HeroiModel> updateHeroi(String id, HeroiModel heroi) async {
    Map data = {
      'nome': heroi.nome,
      'nomeCivil': heroi.nomeCivil,
      'universo': heroi.universo
    };

    final Response res = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      String source = Utf8Decoder().convert(res.bodyBytes);
      return HeroiModel.fromJson(json.decode(source));
    } else {
      throw Exception('Failed to update');
    }
  }

  Future<void> deleteHeroi(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Failed to delete";
    }
  }
}
