import 'package:poke_list/src/domain/params/search_pokemon_params.dart';

import '../typedefs/search_pokemon_result.dart';

abstract class SearchPokemonUsecase {
  SearchPokemonResult call(SearchPokemonParams params);

  const SearchPokemonUsecase();
}
