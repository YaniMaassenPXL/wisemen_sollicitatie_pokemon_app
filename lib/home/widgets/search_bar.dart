import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app_wisemen/home/home.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.searchQuery != current.searchQuery,
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 38,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                onChanged: (search) => context.read<HomeBloc>().add(SearchQueryChanged(searchQuery: search)),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(239, 240, 241, 1),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Pokemon zoeken',
                  border: InputBorder.none,
                ),
              ),
            ),
          );
        }
    );
  }
}