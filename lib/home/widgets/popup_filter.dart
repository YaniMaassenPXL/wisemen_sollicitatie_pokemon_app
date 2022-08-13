import 'dart:math';

import 'package:flutter/material.dart';

class PopupFilter extends StatelessWidget {
  const PopupFilter({Key? key, this.onDismissed}) : super(key: key);

  final DismissDirectionCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.4),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
          ),
          child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in down direction.
              if (details.delta.dy > 0) {
                onDismissed;
              }
            },
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
                          onPressed: () => onDismissed,
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
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 234, 234, 1),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color.fromRGBO(101, 203, 154, 1))
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
                          child: Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromRGBO(101, 203, 154, 1))
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
                          child: Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromRGBO(101, 203, 154, 1))
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
                          child: Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 234, 234, 1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color.fromRGBO(101, 203, 154, 1))
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
                          child: Icon(Icons.check, color: Color.fromRGBO(101, 203, 154, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ElevatedButton(
                    onPressed: null,
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
        ),
      ),
    );
  }
}
