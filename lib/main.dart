import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_app_wisemen/app.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  final PokemonApiClient apiClient = PokemonApiClient();
  runApp(App(repository: apiClient));
}