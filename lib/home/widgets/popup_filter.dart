import 'dart:math';

import 'package:flutter/material.dart';

class PopupFilter extends StatefulWidget {
  const PopupFilter({Key? key, required this.selectedIndex, required this.onSortChanged}) : super(key: key);

  final int selectedIndex;
  final void Function(int index) onSortChanged;

  @override
  State<PopupFilter> createState() => _PopupFilterState();
}

class _PopupFilterState extends State<PopupFilter> {
  late int _selected;

  @override
  void initState() {
    super.initState();

    _selected = widget.selectedIndex;
  }

  void _selectNewOption(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 15, bottom: 10),
                    child: Text('Sorteren op', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * .1,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(234, 234, 234, 1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: Transform.rotate(
                        angle: -pi / 4,
                        child: Icon(Icons.add_circle_rounded, color: Color.fromRGBO(234, 234, 234, 1), size: 32),
                      )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: GestureDetector(
                onTap: () => _selectNewOption(0),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(234, 234, 234, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: _selected == 0 ? Border.all(color: Color.fromRGBO(101, 203, 154, 1)) : null
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset('assets/aa.png', height: 15,),
                      ),
                      Expanded(child: Text('Alphabetisch oplopend')),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _selected == 0 ? Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)) : null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: GestureDetector(
                onTap: () => _selectNewOption(1),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 234, 234, 1),
                      borderRadius: BorderRadius.circular(5),
                      border: _selected == 1 ? Border.all(color: Color.fromRGBO(101, 203, 154, 1)) : null
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset('assets/ad.png', height: 15,),
                      ),
                      Expanded(child: Text('Alphabetisch aflopend')),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _selected == 1 ? Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)) : null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: GestureDetector(
                onTap: () => _selectNewOption(2),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 234, 234, 1),
                      borderRadius: BorderRadius.circular(5),
                      border: _selected == 2 ? Border.all(color: Color.fromRGBO(101, 203, 154, 1)) : null
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset('assets/na.png', height: 15),
                      ),
                      Expanded(child: Text('Numeriek oplopend')),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _selected == 2 ? Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)) : null
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: GestureDetector(
                onTap: () => _selectNewOption(3),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 234, 234, 1),
                      borderRadius: BorderRadius.circular(5),
                      border: _selected == 3 ? Border.all(color: Color.fromRGBO(101, 203, 154, 1)) : null
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset('assets/nd.png', height: 15),
                      ),
                      Expanded(child: Text('Numeriek aflopend')),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _selected == 3 ? Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)) : null
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () => widget.onSortChanged(_selected),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Toepassen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return Colors.black;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
