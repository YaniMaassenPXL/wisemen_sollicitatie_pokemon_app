import 'package:flutter/material.dart';

class LevelChip extends StatelessWidget {
  const LevelChip({Key? key, required this.level}) : super(key: key);

  final int level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Container(
        height: 22,
        decoration: BoxDecoration(
          color: getBackgroundColorForLevel(level),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: getBorderColorForLevel(level))
        ),
        child: Center(
          child: Text('Level ' + level.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: getBorderColorForLevel(level),
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

Color getBackgroundColorForLevel(int lvl) {
  if (lvl <= 1) {
    return Color.fromRGBO(126, 50, 224, 0.2);
  } else if (lvl <= 5) {
    return Color.fromRGBO(21, 208, 220, 0.2);
  } else if (lvl <= 10) {
    return Color.fromRGBO(228, 112, 5, 0.2);
  } else if (lvl <= 20) {
    return Colors.amber.withOpacity(0.2);
  } else if (lvl <= 30) {
    return Colors.pink.withOpacity(0.2);
  } else if (lvl <= 50) {
    return Colors.purple.withOpacity(0.2);
  } else if (lvl <= 75) {
    return Colors.red.withOpacity(0.2);
  } else {
    return Colors.black;
  }
}

Color getBorderColorForLevel(int lvl) {
  if (lvl <= 1) {
    return Color.fromRGBO(100, 60, 192, 1);
  } else if (lvl <= 5) {
    return Color.fromRGBO(64, 206, 186, 1);
  } else if (lvl <= 10) {
    return Color.fromRGBO(231, 139, 26, 1);
  } else if (lvl <= 20) {
    return Colors.amberAccent;
  } else if (lvl <= 30) {
    return Colors.pinkAccent;
  } else if (lvl <= 50) {
    return Colors.purpleAccent;
  } else if (lvl <= 75) {
    return Colors.redAccent;
  } else {
    return Colors.blueGrey;
  }
}
