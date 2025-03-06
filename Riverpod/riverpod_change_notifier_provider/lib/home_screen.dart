import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_change_notifier_/change_notifier.dart';

final counterProvider = ChangeNotifierProvider<CounterNotifier>((ref) {
  return CounterNotifier();
});

class CounterApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: Text("ChangeNotifierProvider"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${counter.count}'),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()=> counter.increment(),
              child: Text('Increment'),
            ),
            ElevatedButton(onPressed: ()=>counter.decrement(), child: Text('Decrement'),),
          ],
          
        ),
      ),
    );
  }
}
