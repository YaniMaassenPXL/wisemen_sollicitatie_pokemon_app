import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_wisemen/team/team.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TeamCubit()..fetchList(),
        child: const TeamView(),
      ),
    );
  }
}

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context
        .watch<TeamCubit>()
        .state;
    switch (state.status) {
      case TeamStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case TeamStatus.success:
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(101, 203, 154, 1),
                      Color.fromRGBO(21, 208, 220, 1)
                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).popAndPushNamed('/'),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                        Text('Terug', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Favorieten', style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  )),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: PokemonCard(
                              pokemon: state.pokemonList[index],
                              onDismissed: (d) => context.read<TeamCubit>().removeItem(state.pokemonList[index].id.toString())
                          ),
                        );
                      },
                      itemCount: state.pokemonList.length
                  ),
                )
              ],
            ),
          ),
        );
      case TeamStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}