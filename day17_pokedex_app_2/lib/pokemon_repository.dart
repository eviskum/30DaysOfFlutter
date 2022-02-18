import 'dart:convert';

import 'package:day17_pokedex_app_2/pokemon_details/pokemon_details.dart';
import 'package:day17_pokedex_app_2/pokemon_species/pokemon_species.dart';

import 'pokemon_page/pokemon_page.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final _baseUrl = 'pokeapi.co';
  final _client = http.Client();
  final _api = 'api/v2/pokemon';

  Future<PokemonPage> getPokemonPage(int pageIndex) async {
    final offset = pageIndex * 100;
    final args = {'limit': '100', 'offset': offset.toString()};

    try {
      final uri = Uri.https(_baseUrl, _api, args);
      final response = await _client.get(uri);
      // final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final pokemonPage = PokemonPage.fromJson(json);
      return pokemonPage;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonDetails> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(_baseUrl, _api + '/$pokemonId');
    try {
      final response = await http.get(uri);
      // final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final pokemonDetails = PokemonDetails.fromJson(json);
      return pokemonDetails;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonSpecies> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(_baseUrl, _api + '-species/$pokemonId');
    try {
      final response = await http.get(uri);
      // final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final pokemonSpecies = PokemonSpecies.fromJson(json);
      return pokemonSpecies;
    } catch (e) {
      rethrow;
    }
  }
}
