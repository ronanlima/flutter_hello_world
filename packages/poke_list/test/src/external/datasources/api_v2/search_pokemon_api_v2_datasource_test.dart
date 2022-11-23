import 'dart:convert';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_list/src/domain/entities/search_pokemon_entity.dart';
import 'package:poke_list/src/domain/params/search_pokemon_params.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_datasource.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_mapper.dart';

import 'api_result/api_result.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  late HttpService httpService;
  SearchPokemonApiV2Mapper mapper;
  late SearchPokemonApiV2Datasource datasource;
  
  setUpAll(() {
    httpService = HttpServiceMock();
    mapper = SearchPokemonApiV2Mapper();
    datasource = SearchPokemonApiV2Datasource(httpService, mapper);
  });

  test('search pokemon working correctly', () {
    when(
      () => httpService.get(
        path: any(named: 'path'),
      )
    ).thenAnswer((invocation) async => HttpResponse(message: '', statusCode: 200, data: jsonDecode(apiResult)));

    expect(
        datasource(const SearchPokemonParams(name: 'charmander')),
        completion(isA<Right>())
    );
  });

  test('search pokemon working correctly v2', () async {
    when(
      () => httpService.get(
        path: any(named: 'path'),
      )
    ).thenAnswer((invocation) async => HttpResponse(message: '', statusCode: 200, data: jsonDecode(apiResult)));

    final result = await datasource(const SearchPokemonParams(name: 'charmander'));
    late SearchPokemonEntity entity;

    result.fold((error) {}, (resultEntity) {
      entity = resultEntity;
    });

    expect(
        entity.abilites.first,
        'limber'
    );

    expect(entity.name, 'ditto');
  });
}