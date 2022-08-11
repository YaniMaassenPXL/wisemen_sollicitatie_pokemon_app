import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatBar extends StatelessWidget {
  const StatBar({Key? key, required this.value, required this.max}) : super(key: key);

  final int value;
  final int max;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: LinearPercentIndicator(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        backgroundColor: Color.fromRGBO(172, 178, 193, 0.2),
        lineHeight: 5,
        percent: value / max,
        progressColor: max > 580 ? totalStatsColor(value) : value > 50
            ? Color.fromRGBO(112, 193, 143, 1)
            : Color.fromRGBO(223, 101, 99, 1),
      ),
    );
  }
}

Color totalStatsColor(int total) {
  if (total < 200) {
    return Colors.red;
  }  else if (total < 300) {
    return Color.fromRGBO(255, 193, 0, 1);
  } else if (total < 400) {
    return Colors.yellow;
  }  else if (total < 500) {
    return Color.fromRGBO(214, 255, 0, 1);
  }  else if (total < 600) {
    return Color.fromRGBO(99, 255, 0, 1);
  }  else {
    return Colors.purple;
  }
}