import 'package:dependencies/dependencies.dart';
import 'package:poke_list/src/domain/errors/search_pokemon_error.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import 'package:poke_list/src/domain/repositories/search_pokemon_repository.dart';
import 'package:poke_list/src/domain/typedefs/search_pokemon_result.dart';
import 'package:poke_list/src/infra/datasources/search_pokemon_datasource.dart';

class SearchPokemonRespositoryImpl extends SearchPokemonRepository {
  SearchPokemonDatasource _datasource;

  SearchPokemonRespositoryImpl(this._datasource);

  @override
  SearchPokemonResult call(SearchPokemonParams params) async {
    try {
      final result = await _datasource(params);
      return result;
    } catch (e) {
      return const Left(SearchPokemonUnkownError('Não foi possível encontrar o pokémon'));
    }
  }
}
