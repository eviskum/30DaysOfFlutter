import 'dart:convert';

import 'package:day16_pokedex_app/pokemon/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final _baseUrl = 'pokeapi.co';
  final _client = http.Client();
  final _api = 'api/v2/pokemon';

  Future<Pokemon> getPokemonPage(int pageIndex) async {
    final offset = pageIndex * 100;
    final args = {'limit': '100', 'offset': offset.toString()};

    try {
      final uri = Uri.https(_baseUrl, _api, args);
      final response = await _client.get(uri);
      // final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final pokemon = Pokemon.fromJson(json);
      return pokemon;
    } catch (e) {
      rethrow;
    }
  }
}
