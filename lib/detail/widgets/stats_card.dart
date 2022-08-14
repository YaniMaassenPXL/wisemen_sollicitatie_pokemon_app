import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/detail/detail.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({Key? key, required this.stats, required this.type}) : super(key: key);

  final List<Stat> stats;
  final String type;

  static TextStyle titleStyle = TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(0.6),
  );
  static const TextStyle statStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final maxStat = getMaxValue(stats);
    int totalStat = 0;
    stats.forEach((stat) => totalStat += stat.base_stat);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text('STATISTIEKEN',
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
              child: Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 25,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(alignment: AlignmentDirectional.centerStart, child: Text(stats[index].stat.name.capitalize(), style: titleStyle)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .1,
                            child: Align(alignment: AlignmentDirectional.center, child: Text(stats[index].base_stat.toString(), style: statStyle)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: StatBar(
                                value: stats[index].base_stat,
                                max: maxStat < 90 ? 90 : maxStat
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(alignment: AlignmentDirectional.centerStart, child: Text('Total', style: titleStyle)),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .1,
                        child: Align(alignment: AlignmentDirectional.center, child: Text(totalStat.toString(), style: statStyle)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: StatBar(
                              value: totalStat,
                              max: 680
                          ),
                        ),
                      )
                    ],
                  ),
                  HexStatGraph(stats: stats, type: type)
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}

int getMaxValue(List<Stat> stats) {
  int max = 0;
  stats.forEach((stat) {
    if (stat.base_stat > max) {
      max = stat.base_stat;
    }
  });
  return max;
}
