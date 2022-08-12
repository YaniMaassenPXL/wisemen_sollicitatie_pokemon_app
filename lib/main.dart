import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app_wisemen/app.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  await Hive.openBox('team');
  await Hive.openBox('viewed');
  Bloc.observer = SimpleBlocObserver();
  final PokemonApiClient apiClient = PokemonApiClient();
  runApp(App(repository: apiClient));
}