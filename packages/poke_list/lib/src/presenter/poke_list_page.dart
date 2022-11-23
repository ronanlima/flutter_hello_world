import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import '../domain/usecases/search_pokemon_usecase.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late SearchPokemonUsecase usecase;

  String pokemonName = '';
  String pokemonId = '';
  List<String> pokemonAbilities = [];

  // @override
  // void didChangeDependencies() {
  //   usecase = DependencyInjectionWidget.of(context)!.get<SearchPokemonUsecase>();
  //   super.didChangeDependencies();
  // }

  void initPage() {
    usecase(const SearchPokemonParams(name: 'charmander')).then((either) {
      either.fold((error) {
        debugPrint(error.toString());
      }, (entity) {
        setState(() {
          pokemonName = entity.name;
          pokemonId = entity.id;
          pokemonAbilities = entity.abilites;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    usecase = DependencyInjectionWidget.of(context)!.get<SearchPokemonUsecase>();
    // final stringDependency = DependencyInjectionWidget.of(context)!.get<String>();
    initPage();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $pokemonName',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'ID: $pokemonId',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20,),
            const Text('List of abilities',),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: pokemonAbilities.length,
                  itemBuilder: (context, index) {
                    return Text(pokemonAbilities[index],textAlign: TextAlign.center,);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
