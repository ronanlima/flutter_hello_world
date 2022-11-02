import 'package:poke_list/src/domain/entities/search_pokemon_entity.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import 'package:poke_list/src/domain/repositories/search_pokemon_repository.dart';
import 'package:poke_list/src/domain/typedefs/search_pokemon_result.dart';
import 'package:poke_list/src/domain/usecases/search_pokemon_usecase.dart';

class SearchPokemonUsecaseImpl extends SearchPokemonUsecase {
  final SearchPokemonRepository _repository;

  const SearchPokemonUsecaseImpl(this._repository);

  @override
  SearchPokemonResult call(SearchPokemonParams params) {
    return _repository(params);
  }


}