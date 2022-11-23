import 'dart:developer';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:poke_list/src/domain/errors/search_pokemon_error.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import 'package:poke_list/src/domain/typedefs/search_pokemon_result.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_mapper.dart';
import 'package:poke_list/src/infra/datasources/search_pokemon_datasource.dart';

class SearchPokemonApiV2Datasource extends SearchPokemonDatasource {
  final HttpService httpService;
  final SearchPokemonApiV2Mapper mapper;
  
  const SearchPokemonApiV2Datasource(this.httpService, this.mapper);

  @override
  SearchPokemonResult call(SearchPokemonParams params) async {
    const baseUrl = 'https://pokeapi.co/api/v2/';
    final pokemonName = params.name;
    try {
      var mPath = '${baseUrl}pokemon/$pokemonName';
      log('path: $mPath');
      final result = await httpService.get(path: mPath);
      log('result: $result');
      final data = result.data;
      if (data != null) {
        log('data != null');
        final mapResult = mapper.fromMap(result.data);
        return Right(mapResult);
      }
      return Left(SearchPokemonNotFoundError('Pokémon não encontrado'));
    } catch (e) {
      print(e);
      return Left(SearchPokemonNotFoundError('Não foi possível encontrar o pokémon'));
    }
  }

}