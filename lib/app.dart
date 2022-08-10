import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_wisemen/home/home.dart';

class App extends MaterialApp {
  App({super.key, required PokemonApiClient repository})
      : super(
          debugShowCheckedModeBanner: false,
          home: RepositoryProvider.value(
            value: repository,
            child: const Home(),
          ),
        );
}
