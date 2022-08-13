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

  Future<List<Pokemon>> getEvolutions(int id) async {
    try {
      final firstPokemon = await getPokemonById(id);
      List<Pokemon> evolutions = [];

      final species = await getSpeciesById(id);
      final evolutionChainId = species.evolution_chain.url.split('/')[species.evolution_chain.url.split('/').length - 2];
      final evolutionChain = await getEvolutionChainById(int.parse(evolutionChainId));

      //Sorry voor wie dit moet lezen
      List<int> ids = [];
      ids.add(int.parse(evolutionChain.chain.species.url.split('/')[evolutionChain.chain.species.url.split('/').length - 2]));
      for (int i = 0; i < 4; i++) {
        if (i == 0) {
          evolutionChain.chain.evolves_to.forEach((element) {
            final pokemonId = element.species.url.split('/')[element.species.url.split('/').length - 2];
            ids.add(int.parse(pokemonId));
          });
        } else if (i == 2) {
          if (evolutionChain.chain.evolves_to.isNotEmpty) {
            evolutionChain.chain.evolves_to.first.evolves_to.forEach((element) {
              final pokemonId = element.species.url.split('/')[element.species.url.split('/').length - 2];
              ids.add(int.parse(pokemonId));
            });
          }
        } else if (i == 3 && evolutionChain.chain.evolves_to.isNotEmpty) {
          if (evolutionChain.chain.evolves_to.first.evolves_to.isNotEmpty) {
            evolutionChain.chain.evolves_to.first.evolves_to.first.evolves_to.forEach((element) {
              final pokemonId = element.species.url.split('/')[element.species.url.split('/').length - 2];
              ids.add(int.parse(pokemonId));
            });
          }
        } else if (i == 4 && evolutionChain.chain.evolves_to.isNotEmpty) {
          if (evolutionChain.chain.evolves_to.first.evolves_to.isNotEmpty) {
            if (evolutionChain.chain.evolves_to.first.evolves_to.first.evolves_to.isNotEmpty) {
              evolutionChain.chain.evolves_to.first.evolves_to.first.evolves_to.forEach((element) {
                final pokemonId = element.species.url.split('/')[element.species.url.split('/').length - 2];
                ids.add(int.parse(pokemonId));
              });
            }
          }
        }
      }
      for (int i = 0; i < ids.length; i++) {
        final evolution = await getPokemonById(ids[i]);
        evolutions.add(evolution);
      }
      return evolutions;
    } catch(e) {
      throw new PokemonApiException(e.toString());
    }
  }

  Future<EvolutionSpecies> getSpeciesById(int id) async {
    try {
      final request = Uri.https(_baseUrl, '/api/v2/pokemon-species/' + id.toString());
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
      return EvolutionSpecies.fromJson(responseJson);
    } catch(e) {
      throw new PokemonApiException(e.toString());
    }
  }

  Future<Evolutions> getEvolutionChainById(int id) async {
    try {
      final request = Uri.https(_baseUrl, '/api/v2/evolution-chain/' + id.toString());
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
      return Evolutions.fromJson(responseJson);
    } catch(e) {
      throw new PokemonApiException(e.toString());
    }
  }
}