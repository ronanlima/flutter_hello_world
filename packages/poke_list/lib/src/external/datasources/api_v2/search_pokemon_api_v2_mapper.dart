import 'package:poke_list/src/domain/entities/search_pokemon_entity.dart';
import 'dart:developer';

class SearchPokemonApiV2Mapper {
  SearchPokemonEntity fromMap(Map<String, dynamic> data) {
    log('iniciando fromMap');
    final id = data['id'].toString();
    log('id: $id');
    final name = data['species']['name'];
    log('name: $name');
    final abilityList = data['abilities'] as List;
    log('abilityList: $abilityList');
    // final abilities = abilityList.map((e) => e['ability']['name']).toList().cast<String>();
    final abilities = abilityList.map((e) => e['ability']['name'] as String).toList();
    log('abilities: $abilities');

    final pokemon = SearchPokemonEntity(id: id, name: name, abilites: abilities);
    return pokemon;
  }
}
