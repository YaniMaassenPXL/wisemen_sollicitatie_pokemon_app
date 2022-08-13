import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/detail/detail.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon, this.onDismissed}) : super(key: key);

  final Pokemon pokemon;
  final DismissDirectionCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: onDismissed,
      child: Card(
        elevation: 5,
        child: ListTile(
            onTap: () => Navigator.of(context).push(DetailPage.route(pokemon: pokemon)),
            leading: Image.network(pokemon.sprites.front_default),
            title: Text(pokemon.name.capitalize(),
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text('Nr. ' + pokemon.id.toString(),
              style: TextStyle(
                  fontSize: 16,
                  height: 1
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: pokemon.types.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: getColorFromType(pokemon.types[index].type.name),
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(pokemon.types[index].type.name.capitalize(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                              ),
                            );
                          }
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
                Icon(Icons.keyboard_arrow_right, size: 22),
              ],
            )
        ),
      ),
    );
  }
}