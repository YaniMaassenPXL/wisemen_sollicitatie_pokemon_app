import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_wisemen/home/home.dart';

class IconBar extends StatelessWidget {
  const IconBar({Key? key, required this.onChanged, this.onSwitch}) : super(key: key);

  final void Function(int index) onChanged;
  final void Function()? onSwitch;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.read<HomeBloc>().state.sortIndex;
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
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                useRootNavigator: true,
                context: context,
                builder: (context) {
                    return Wrap(
                      children: [
                        PopupFilter(selectedIndex: selectedIndex, onSortChanged: (index) => onChanged(index))
                      ],
                    );
                  }
              );
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('assets/order_icon.png', height: 18),
            ),
            onTap: onSwitch,
          )
        ],
      ),
    );
  }
}
