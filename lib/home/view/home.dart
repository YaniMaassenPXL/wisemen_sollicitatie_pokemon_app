import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/home/home.dart';
import 'package:pokemon_app_wisemen/home/widgets/pokemon_list_tile.dart';
import 'package:pokemon_app_wisemen/home/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeCubit(
          pokemonApiClient: context.read<PokemonApiClient>(),
        )..fetchList(),
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    switch (state.status) {
      case HomeStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case HomeStatus.success:
        return Column(
          children: [
            IconBar(),
            Expanded(
              child: ListView.builder(
                itemCount: state.pokemonList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: PokemonListTile(pokemon: state.pokemonList[index]),
                  );
                }
              ),
            )
          ],
        );
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

