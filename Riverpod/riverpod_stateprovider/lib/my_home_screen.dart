import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:riverpod/riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

class MyHomeScreen extends ConsumerWidget {
  const MyHomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Demo')),
      body: Column(
        children: [
          Center(
            child: Text(counterState.toString(),style: const TextStyle(fontSize: 50),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state ++;
              },
              child: Text('+'),),
            ],
          )
        ],
      )
    );
  }
}
