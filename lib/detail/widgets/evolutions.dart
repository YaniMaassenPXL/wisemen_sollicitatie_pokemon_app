import 'package:flutter/material.dart';
import 'package:pokemon_app_wisemen/detail/detail.dart';
import 'package:pokemon_api/pokemon_api.dart';

class EvolutionsView extends StatelessWidget {
  const EvolutionsView({Key? key, required this.original, required this.evolutions}) : super(key: key);

  final int original;
  final List<Pokemon> evolutions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text('EVOLUTIONS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14
                )
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: evolutions.length,
            itemBuilder: (context, index) {
              return PokemonListTile(
                isMain: evolutions[index].id == original,
                pokemon: evolutions[index],
              );
            }
          )
        ],
      ),
    );
  }
}
