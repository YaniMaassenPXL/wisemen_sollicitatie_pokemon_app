import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_app_wisemen/app.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Storage storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory()
  );
  Bloc.observer = SimpleBlocObserver();
  final PokemonApiClient apiClient = PokemonApiClient();
  HydratedBlocOverrides.runZoned(() => runApp(App(repository: apiClient)), storage: storage);
}