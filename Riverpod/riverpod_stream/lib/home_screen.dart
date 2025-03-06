import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStreamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 1), (count) => count);
  // .take(10);
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: counter.when(
          data:
              (count) => Text(
                "Count : $count",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
          error: (err, stack) => Text("Error: $err"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
