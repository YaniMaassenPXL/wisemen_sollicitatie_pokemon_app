import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/detail/detail.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static Route<void> route({required Pokemon pokemon}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => DetailBloc(
          pokemon: pokemon,
          pokemonApiClient: PokemonApiClient()
        )..add(FetchDetails()),
        child: const DetailPageView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailBloc, DetailState>(
        child: const DetailPageView(),
        listener: (context, state) {},
        listenWhen: (previous, current) =>
        previous.status != current.status
    );
  }
}

class DetailPageView extends StatefulWidget {
  const DetailPageView({Key? key}) : super(key: key);

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {

  late ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients;
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorFromType(context.read<DetailBloc>().state.pokemon.types.first.type.name),
      body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            switch(state.status) {
              case DetailStatus.success:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: isShrink ? getColorFromType(state.pokemon.types.first.type.name).withOpacity(0.8) : Colors.transparent,
                      floating: true,
                      centerTitle: true,
                      titleTextStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                      pinned: true,
                      title: !isShrink ? Text(state.pokemon.name.capitalize()) : Text(''),
                      leading: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back_ios)
                      ),
                      actions: [
                        IconButton(
                          onPressed: () => context.read<DetailBloc>().add(AddToFavorites()),
                          icon: state.favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border, color: Colors.white)
                        )
                      ],
                    ),
                    SliverToBoxAdapter(child: SpritesCarousel(sprites: state.pokemon.sprites)),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          AboutCard(pokemon: state.pokemon),
                          StatsCard(stats: state.pokemon.stats!),
                          MoveSetCard(moves: state.pokemon.moves!),
                          Visibility(
                            visible: state.evolutions.isNotEmpty,
                            child: EvolutionsView(
                              evolutions: state.evolutions,
                              original: state.pokemon.id,
                            )
                          )
                        ]
                      ),
                    )
                  ],
                );
              case DetailStatus.failure:
                return Center(child: Text('Something went wrong'));
              case DetailStatus.loading:
                return Center(child: CircularProgressIndicator());
            }
          }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: BlocBuilder<DetailBloc, DetailState>(
        buildWhen: (current, previous) => current.team != previous.team,
        builder: (context, state) {
          return Visibility(
            visible: !state.team,
            child: ElevatedButton(
              onPressed: () => context.read<DetailBloc>().add(AddToTeam()),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .85,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Toevoegen aan mijn team',
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
          );
        },
      ),
    );
  }
}

