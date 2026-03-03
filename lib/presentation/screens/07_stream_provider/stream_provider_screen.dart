import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/07_stream_provider/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: StramView(),
    );
  }
}

class StramView extends ConsumerWidget {
  const StramView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChatAsync = ref.watch(userInChatProvider);

    if (usersInChatAsync.isLoading) {
      return const CircularProgressIndicator();
    }

    if (usersInChatAsync.hasError) {
      return Center(
        child: Text("${usersInChatAsync.error}"),
      );
    }

    final user = usersInChatAsync.value!;

    return ListView.builder(
        itemCount: user.length,
        itemBuilder: (BuildContext context, int index) {
          final users = user[index];

          return ListTile(
            title: Text(users),
          );
        });
  }
}
