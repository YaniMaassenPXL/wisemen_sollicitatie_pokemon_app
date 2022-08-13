import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/home/home.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeBloc(
          pokemonApiClient: context.read<PokemonApiClient>(),
        )..add(FetchList()),
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    switch (state.status) {
      case HomeStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case HomeStatus.success:
        return Stack(
          children: [
            Column(
              children: [
                IconBar(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text('Pokédex',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            child: SearchBar(),
                          ),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _SliverTabsDelegate(
                            SelectionCard(height: MediaQuery.of(context).size.height * .15, team: state.team ?? 0, favorites: state.favorites ?? 0)
                          ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: PokemonListTile(pokemon: state.filteredPokemonList[index]),
                                );
                              },
                            childCount: state.filteredPokemonList.length
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
            PopupFilter()
          ],
        );
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class _SliverTabsDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabsDelegate(this._tab);

  final SelectionCard _tab;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tab,
    );
  }

  @override
  double get maxExtent => _tab.height;

  @override
  double get minExtent => _tab.height * 0.8;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}

