import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_wisemen/favorites/favorites.dart';
import 'package:pokemon_app_wisemen/home/home.dart';
import 'package:pokemon_app_wisemen/team/team.dart';

class App extends MaterialApp {
  App({super.key, required PokemonApiClient repository})
      : super(
          initialRoute: '/',
          routes: {
            '/': (context) => RepositoryProvider.value(
              value: repository,
              child: const Home(),
            ),
            '/favorites': (context) => const Favorites(),
            '/team': (context) => const Team()
          },
          debugShowCheckedModeBanner: false,
        );
}
