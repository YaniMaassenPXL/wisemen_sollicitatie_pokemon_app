import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

Color getColorFromType(String type) {
  switch(type.toLowerCase()) {
    case 'normal':
      return Color.fromRGBO(168, 167, 122, 1);
    case 'fire':
      return Color.fromRGBO(238, 129, 48, 1);
    case 'water':
      return Color.fromRGBO(99, 144, 240, 1);
    case 'electric':
      return Color.fromRGBO(247, 208, 44, 1);
    case 'grass':
      return Color.fromRGBO(122, 199, 76, 1);
    case 'ice':
      return Color.fromRGBO(150, 217, 214, 1);
    case 'fighting':
      return Color.fromRGBO(194, 46, 40, 1);
    case 'poison':
      return Color.fromRGBO(163, 62, 161, 1);
    case 'ground':
      return Color.fromRGBO(226, 191, 101, 1);
    case 'flying':
      return Color.fromRGBO(169, 143, 243, 1);
    case 'psychic':
      return Color.fromRGBO(249, 85, 135, 1);
    case 'bug':
      return Color.fromRGBO(166, 185, 26, 1);
    case 'rock':
      return Color.fromRGBO(182, 161, 54, 1);
    case 'ghost':
      return Color.fromRGBO(115, 87, 151, 1);
    case 'dragon':
      return Color.fromRGBO(111, 53, 252, 1);
    case 'dark':
      return Color.fromRGBO(112, 87, 70, 1);
    case 'steel':
      return Color.fromRGBO(183, 183, 206, 1);
    case 'fairy':
      return Color.fromRGBO(214, 133, 173, 1);
    default:
      return Colors.white;
  }
}