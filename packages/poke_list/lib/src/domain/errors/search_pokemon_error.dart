abstract class SearchPokemonError {
  final String message;

  const SearchPokemonError(this.message);

  @override
  String toString() => message;
}

class SearchPokemonNotFoundError extends SearchPokemonError {
  const SearchPokemonNotFoundError(super.message);
}

class SearchPokemonUnkownError extends SearchPokemonError {
  const SearchPokemonUnkownError(super.message);
}
