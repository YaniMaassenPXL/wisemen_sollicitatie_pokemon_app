import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({Key? key, required this.height, required this.team, required this.favorites}) : super(key: key);

  final double height;
  final int team;
  final int favorites;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 4, 8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color.fromRGBO(70, 70, 156, 1), Color.fromRGBO(126, 50, 224, 1)]
                  )
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Mijn team',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          Text(team.toString() + ' pokemons',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.4)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/ball_purple.png', height: MediaQuery.of(context).size.height * .13)
                    )
                  ],
                ),
              ),
            )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 2, 8, 8),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[Color.fromRGBO(101, 203, 154, 1), Color.fromRGBO(21, 208, 220, 1)]
                      )
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Favorieten',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            Text(favorites.toString() + ' pokemons',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.4)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset('assets/ball_green.png', height: MediaQuery.of(context).size.height * .13)
                      )
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
