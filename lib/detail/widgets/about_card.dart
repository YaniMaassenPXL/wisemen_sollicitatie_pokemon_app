import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;
  static TextStyle titleStyle = TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(0.6),
  );
  static const TextStyle statStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text('INFO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14
              )
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Type', style: titleStyle),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 25,
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
                        )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(alignment: AlignmentDirectional.centerStart, child: Text('Nummer', style: titleStyle)),
                        ),
                      ),
                      Text(pokemon.id.toString().padLeft(3, '0'), style: statStyle)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(alignment: AlignmentDirectional.centerStart, child: Text('Hoogte', style: titleStyle)),
                        ),
                      ),
                      Text((pokemon.height! / 10).toString() + 'm', style: statStyle)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(alignment: AlignmentDirectional.centerStart, child: Text('Gewicht', style: titleStyle)),
                        ),
                      ),
                      Text((pokemon.weight! / 10).toString() + ' kg' , style: statStyle)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
