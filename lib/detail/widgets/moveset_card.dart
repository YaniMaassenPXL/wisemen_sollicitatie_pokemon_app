import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/detail/widgets/widgets.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class MoveSetCard extends StatelessWidget {
  const MoveSetCard({Key? key, required this.moves}) : super(key: key);

  final List<MoveDetails> moves;

  static TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14
  );

  static TextStyle moveStyle = TextStyle(fontSize: 14);

  static TextStyle methodStyle = TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8));

  @override
  Widget build(BuildContext context) {
     moves.sort((a, b) {
      int level = a.version_group_details.last.level_learned_at.compareTo(b.version_group_details.last.level_learned_at);
      if (level == 0) {
        int method = a.version_group_details.last.move_learn_method.name.compareTo(b.version_group_details.last.move_learn_method.name);
        if (method == 0) {
          return a.move.name.compareTo(b.move.name);
        }  else {
          return method;
        }
      } else {
        return level;
      }
    });
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
                    fontSize: 14,
                )
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Level',
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        )
                      ),
                      Expanded(
                          child: Text('Name',
                            style: titleStyle,
                            textAlign: TextAlign.center,
                          )
                      ),
                      Expanded(
                          child: Text('Method',
                            style: titleStyle,
                            textAlign: TextAlign.center,
                          )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moves.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(child: LevelChip(level: moves[index].version_group_details.last.level_learned_at)),
                          Expanded(child: Text(moves[index].move.name.capitalize(), style: moveStyle)),
                          Expanded(child: Text(moves[index].version_group_details.last.move_learn_method.name.capitalize(), style: methodStyle, textAlign: TextAlign.center))
                        ],
                      );
                    }
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
