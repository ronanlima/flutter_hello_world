import 'package:dependencies/dependencies.dart';
import 'package:poke_list/src/domain/entities/search_pokemon_entity.dart';
import 'package:poke_list/src/domain/errors/search_pokemon_error.dart';

typedef SearchPokemonResult = Future<Either<SearchPokemonError, SearchPokemonEntity>>;