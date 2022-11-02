import 'package:flutter/material.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import 'package:poke_list/src/domain/repositories/search_pokemon_repository.dart';
import 'package:poke_list/src/domain/usecases/search_pokemon_usecase.dart';
import 'package:poke_list/src/domain/usecases/search_pokemon_usecase_impl.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_datasource.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_mapper.dart';
import 'package:poke_list/src/infra/datasources/search_pokemon_datasource.dart';
import 'package:poke_list/src/infra/repositories/search_pokemon_repository_impl.dart';
import 'package:uno_http_service/uno_http_service.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late SearchPokemonUsecase usecase;
  late SearchPokemonRepository repository;
  late SearchPokemonDatasource datasource;
  late SearchPokemonApiV2Mapper mapper;
  late UnoHttpClient unoHttpClient;

  String pokemonName = '';
  String pokemonId = '';
  List<String> pokemonAbilities = [];

  @override
  void initState() {
    mapper = SearchPokemonApiV2Mapper();
    unoHttpClient = UnoHttpClient();
    datasource = SearchPokemonApiV2Datasource(unoHttpClient, mapper);
    repository = SearchPokemonRespositoryImpl(datasource);
    usecase = SearchPokemonUsecaseImpl(repository);
    super.initState();
  }

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
