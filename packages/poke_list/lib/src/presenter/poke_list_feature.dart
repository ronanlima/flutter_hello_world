import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:poke_list/src/domain/usecases/search_pokemon_usecase.dart';
import 'package:poke_list/src/domain/usecases/search_pokemon_usecase_impl.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_datasource.dart';
import 'package:poke_list/src/external/datasources/api_v2/search_pokemon_api_v2_mapper.dart';
import 'package:poke_list/src/infra/repositories/search_pokemon_repository_impl.dart';
import 'package:uno_http_service/uno_http_service.dart';

import 'poke_list_page.dart';

class PokeListFeature extends Feature {

  @override
  Map<Type, Object> dependencies({DependencyInjectionWidget? injector}) {
    final analyticsService = injector?.get<AnalyticsService>();
    if (analyticsService == null) {
      throw Exception();
    }
    final httpClient = UnoHttpClient();
    final mapper = SearchPokemonApiV2Mapper();
    final datasource = SearchPokemonApiV2Datasource(httpClient, mapper);
    final repository = SearchPokemonRespositoryImpl(datasource);
    final usecase = SearchPokemonUsecaseImpl(repository);
    return <Type, Object>{SearchPokemonUsecase: usecase};
  }

  @override
  Widget get child => const PokeListPage();

  const PokeListFeature({super.key});

}