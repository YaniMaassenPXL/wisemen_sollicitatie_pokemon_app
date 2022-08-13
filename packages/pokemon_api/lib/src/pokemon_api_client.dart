import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:pokemon_api/pokemon_api.dart';

class PokemonApiException implements Exception {
  const PokemonApiException([
    this.message = 'Error fetching data.'
  ]);

  final String message;
}

class PokemonApiClient {

  PokemonApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();
  
  final http.Client _httpClient;
  static const _baseUrl = 'pokeapi.co';
  
  Future<List<Pokemon>> getAllPokemon() async {
    try {
      final request = Uri.https('stoplight.io', '/mocks/appwise-be/pokemon/57519009/pokemon');
      final response = await _httpClient.get(
          request,
          headers: {
            'Content-Type': 'application/json'
          }
      );

      if (response.statusCode != 200) {
        throw new Exception('API issue');
      }

      final responseJson = jsonDecode(response.body) as List<dynamic>;
      return List<Pokemon>.from(responseJson.map((e) => Pokemon.fromJson(e))).toList();
    } catch(e) {
      throw new PokemonApiException(e.toString());
    }
  }

  Future<Pokemon> getPokemonById(int id) async {
    try {
      final request = Uri.https(_baseUrl, '/api/v2/pokemon/' + id.toString());
      final response = await _httpClient.get(
          request,
          headers: {
            'Content-Type': 'application/json'
          }
      );

      if (response.statusCode != 200) {
        throw new Exception('API issue');
      }

      final responseJson = jsonDecode(response.body) as dynamic;
      return Pokemon.fromJson(responseJson);
    } catch(e) {
      throw new PokemonApiException(e.toString());
    }
  }
}