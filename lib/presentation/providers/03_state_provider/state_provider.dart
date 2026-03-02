import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increment() {
    state++;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() {
    return "Melisssa";
  }

  void changeName(String name) {
    state = name;
  }
}
