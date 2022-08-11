import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';

class MoveSetCard extends StatelessWidget {
  const MoveSetCard({Key? key, required this.moves}) : super(key: key);

  final List<MoveDetails> moves;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text('MOVESET',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14
                )
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: moves.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(height: 25, child: Text(moves[index].move.name)),
                    ],
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
