import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/pokemon_information.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
class PokemonName extends _$PokemonName {
  @override
  Future<String> build() async {
    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

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
}
