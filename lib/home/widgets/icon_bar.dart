import 'package:flutter/material.dart';

class IconBar extends StatelessWidget {
  const IconBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('assets/filter_icon.png', height: 18),
            ),
            onTap: null,
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('assets/order_icon.png', height: 18),
            ),
            onTap: null,
          )
        ],
      ),
    );
  }
}
