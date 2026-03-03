import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/pokemon_information.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
class PokemonName extends _$PokemonName {
  @override
  Future<String> build() async {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

    // ref.onDispose(() {
    //   debugPrint("raaa");
    // })

    return pokemonName;
  }
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  void nextPokemon() {
    state++;
  }

  void prevPokemon() {
    state--;
  }
}

@Riverpod(keepAlive: true)
Future<String> pokemon(Ref ref, int pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}
